library(RobPer)


### Name: betaCvMfit
### Title: Robust fit of a Beta distribution using CvM distance
###   minimization
### Aliases: betaCvMfit

### ** Examples

# data:
set.seed(12)
PP <- c(rbeta(45, shape1=4, shape2=15), runif(5, min=0.8, max=1))
hist(PP, freq=FALSE, breaks=30, ylim=c(0,7), xlab="Periodogram bar")

# true parameters:
myf.true <- function(x) dbeta(x, shape1=4, shape2=15)
curve(myf.true, add=TRUE, lwd=2)

# method of moments:
par.mom <- betaCvMfit(PP, rob=FALSE, CvM=FALSE)
myf.mom <- function(x) dbeta(x, shape1=par.mom[1], shape2=par.mom[2])
curve(myf.mom, add=TRUE, lwd=2, col="red")

# robust method of moments
par.rob <- betaCvMfit(PP, rob=TRUE, CvM=FALSE)
myf.rob <- function(x) dbeta(x, shape1=par.rob[1], shape2=par.rob[2])
curve(myf.rob, add=TRUE, lwd=2, col="blue")

# CvM distance minimization
par.CvM <- betaCvMfit(PP, rob=TRUE, CvM=TRUE)
myf.CvM <- function(x) dbeta(x, shape1=par.CvM[1], shape2=par.CvM[2])
curve(myf.CvM, add=TRUE, lwd=2, col="green")

# Searching for outliers...
abline(v=qbeta((0.95)^(1/50), shape1=par.CvM[1], shape2=par.CvM[2]), col="green")

legend("topright", fill=c("black", "green","blue", "red"),
    legend=c("true", "CvM", "robust moments", "moments"))
box()



