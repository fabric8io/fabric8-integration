#!/usr/bin/env bash
echo ============================================
echo Deploying fabric8-integration documentation
echo ============================================

cd docs && \
mvn -Phtml,pdf package && \
git clone -b gh-pages https://jstrachan:${GITHUB_TOKEN}@github.com/fabric8io/fabric8-integration.git gh-pages && \
git config --global user.email "travis@fabric8.io" && \
git config --global user.name "Travis" && \
cp -rv target/generated-docs/* gh-pages/ && \
cd gh-pages && \
mv index.pdf fabric8-integration.pdf && \
git add --ignore-errors * && \
git commit -m "generated documentation" && \
git push origin gh-pages && \
cd .. && \
rm -rf gh-pages target
