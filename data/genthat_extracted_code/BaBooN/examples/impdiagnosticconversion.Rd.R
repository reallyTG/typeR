library(BaBooN)


### Name: impdiagnosticconversion
### Title: Conversion from BBPMM output to mice's mids object or prepares
###   imputed data for coda's mcmc or mcmc.list objects
### Aliases: impdiagnosticconversion
### Keywords: conversion

### ** Examples

## Not run: 
##D ### sample data set with non-normal variables
##D set.seed(1000)
##D n <- 50
##D x1 <- round(runif(n,0.5,3.5))
##D x2 <- as.factor(c(rep(1,10),rep(2,25),rep(3,15)))
##D x3 <- round(rnorm(n,0,3))
##D y1 <- round(x1-0.25*(x2==2)+0.5*x3+rnorm(n,0,1))
##D y1 <- ifelse(y1<1,1,y1)
##D y1 <- as.factor(ifelse(y1>4,5,y1))
##D y2 <- x1+rnorm(n,0,0.5)
##D y3 <- round(x3+rnorm(n,0,2))
##D data1 <- as.data.frame(cbind(x1,x2,x3,y1,y2,y3))
##D misrow1 <- sample(n,20)
##D misrow2 <- sample(n,15)
##D misrow3 <- sample(n,10)
##D is.na(data1[misrow1, 4]) <- TRUE
##D is.na(data1[misrow2, 5]) <- TRUE
##D is.na(data1[misrow2, 6]) <- TRUE
##D 
##D ### imputation
##D imputed.data <- BBPMM(data1, nIter=3, M=3)
##D 
##D ### Test Conversion
##D if(!require(coda)) install.packages("coda")
##D if(!require(mice)) install.packages("mice")
##D 
##D require(coda) ## see references
##D require(mice) ## see references
##D require(lattice) ## see references
##D 
##D ## conversion to mcmc
##D imp.to.mcmc <- impdiagnosticconversion(imputed.data,
##D                                        type="mcmc")
##D 
##D ## conversion to mcmc.list
##D imp.to.mcmc.list <- impdiagnosticconversion(imputed.data,
##D                                             type="mcmc.list")
##D 
##D ## conversion to mids
##D imp.to.mids <- impdiagnosticconversion(imputed.data,
##D                                        type="mids")
##D 
##D ### Test
##D 
##D ## mcmc:
##D plot(imp.to.mcmc$means[[1]])
##D acfplot(imp.to.mcmc$vars[[1]])
##D plot(imp.to.mcmc$medians[[1]])
##D acfplot(imp.to.mcmc$sds[[1]])
##D 
##D ## mcmc.list:
##D xyplot(imp.to.mcmc.list[[1]]) ## Mean
##D qqmath(imp.to.mcmc.list[[2]]) ## Variance
##D xyplot(imp.to.mcmc.list[[3]]) ## Median
##D qqmath(imp.to.mcmc.list[[4]]) ## Std.dev.
##D 
##D ## mids:
##D # Chain-plot from mice
##D mice:::plot.mids(imp.to.mids)
##D 
## End(Not run)



