library(SparseM)


### Name: slm.methods
### Title: Methods for slm objects
### Aliases: slm.methods summary.slm summary.mslm print.summary.slm
###   print.slm fitted.slm residuals.slm coef.slm extractAIC.slm
###   deviance.slm
### Keywords: regression

### ** Examples

data(lsq)
X <- model.matrix(lsq) #extract the design matrix
y <- model.response(lsq) # extract the rhs
X1 <- as.matrix(X)
slm.time <- system.time(slm(y~X1-1) -> slm.o) # pretty fast
cat("slm time =",slm.time,"\n")
cat("slm Results: Reported Coefficients Truncated to 5  ","\n")
sum.slm <- summary(slm.o)
sum.slm$coef <- sum.slm$coef[1:5,]
sum.slm
fitted(slm.o)[1:10]
residuals(slm.o)[1:10]
coef(slm.o)[1:10]



