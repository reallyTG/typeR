library(cgwtools)


### Name: getstack
### Title: Returns the current directory stack that pushd and popd
###   manipulate
### Aliases: getstack

### ** Examples

## depends on your local directory structure and permissions
getwd()
getstack() #empty, probably
pushd('..')
getstack()
pushd('.')
getstack()
popd()
getstack()
popd()
getstack()
getwd() #back where we started



