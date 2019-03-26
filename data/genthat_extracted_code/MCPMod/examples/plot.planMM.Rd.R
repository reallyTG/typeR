library(MCPMod)


### Name: plot.planMM
### Title: Plotting a planMM object
### Aliases: plot.planMM
### Keywords: methods hplot

### ** Examples

## Not run: 
##D doses <- c(0, 10, 25, 50, 100, 150)
##D models <- list(linear = NULL, emax = c(25),
##D                logistic = c(50, 10.88111), exponential = c(85),
##D                betaMod = matrix(c(0.33, 2.31, 1.39, 1.39),
##D                 byrow=TRUE,nrow=2))
##D pM <- planMM(models, doses, 50, scal = 200)
##D plot(pM)
##D plot(pM, superpose=FALSE, xlab="Different axis name")
##D plot(pM, resp = "means")
##D # example with muMat
##D dvec <- c(0, 10, 50, 100)
##D mu1 <- c(1, 2, 2, 2)
##D mu2 <- c(1, 1, 2, 2)
##D mu3 <- c(1, 1, 1, 2)
##D mMat <- cbind(mu1, mu2, mu3)
##D dimnames(mMat)[[1]] <- dvec
##D pM <- planMM(muMat = mMat, doses = dvec, n = 30)
##D plot(pM)
##D plot(pM, superpose=FALSE, xlab="Different axis name")
## End(Not run)



