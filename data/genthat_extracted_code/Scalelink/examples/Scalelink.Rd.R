library(Scalelink)


### Name: Scalelink
### Title: Record linkage via scaling algorithm
### Aliases: Scalelink Scalelink-package

### ** Examples

library(Scalelink)

## Set the number of CPU cores to use (omit to use all available)
RcppParallel::setThreadOptions(numThreads = 2)

data(FOI, package = "Scalelink")
data(LDFCOMP, package = "Scalelink")

idcols <- c("Day", "Month", "Year", "Sex")
result <- calcScores(FOI[, idcols], LDFCOMP[, idcols])

print(result$scores)

## Scalelink package provides two examples using synthetic data
## one with complete data and one containing missing values

## Not run: 
##D ## For a list of demo titles
##D demo(package = 'Scalelink')
##D 
##D ## To run a demo
##D demo(Example1)
##D 
##D ## Using your own data
##D ##If you had the following files in your working directory:
##D ##FOI:
##D ##A space-delimited file of interest (NFOI x PFOI). NFOI is number of records
##D ##IDENTIFIERS_FOI:
##D ##A space-delimited file containing a row vector length PFOI with a 1 where it is an identifier
##D ##LDF:
##D ##A space-delimited linking data file (NLDF x PLDF). NLDF is number of records
##D ##IDENTIFIERS_LDF:
##D ##A space-delimited file containing a row vector length PLDF with a 1 where it is an identifier
##D 
##D ##Then you can calculate scores as follows:
##D FOI<-read.table("FOI")
##D LDF<-read.table("LDF")
##D IDENTIFIERS_FOI<-read.table('IDENTIFIERS_FOI')
##D IDENTIFIERS_LDF<-read.table('IDENTIFIERS_LDF')
##D result <- calcScores(FOI[, which(IDENTIFIERS_FOI == 1)], LDF[, which(IDENTIFIERS_LDF == 1)], 
##D missing.value=-9.999e+029)
##D 
##D ##To view the scores:
##D print(round(result$scores, 2))
##D 
##D ##To view the A* matrix:
##D print(result$astar)
## End(Not run)




