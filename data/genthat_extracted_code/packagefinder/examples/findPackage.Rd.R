library(packagefinder)


### Name: findPackage
### Title: Searching for packages on CRAN
### Aliases: findPackage

### ** Examples

## No test: 
search <- "regression"
findPackage(search)

findPackage(c("text", "tables"), mode="and")

searchindex <- buildIndex()
findPackage(keywords=c("regression", "linear"), index=searchindex,
   mode="and", always.sensitive="GLM")
## End(No test)



