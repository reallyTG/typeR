library(gets)


### Name: isattest
### Title: Indicator Saturation Test
### Aliases: isattest
### Keywords: Statistical Models Time Series Econometrics Financial
###   Econometrics

### ** Examples

##Using artificial data:
#set.seed(123)
#d <- matrix(0,100,1)
#d[35:55] <- 1
#e <- rnorm(100, 0, 1)
#y <- d*2  +e 
#plot(y, type="l")

##Static Test against hnull=0 using bias-correction:

#ys <- isat(y, sis=TRUE, iis=FALSE, tis=FALSE, t.pval=0.01)
#isattest(ys, hnull=0, lr=FALSE, ci.pval = 0.99, plot.turn = FALSE, biascorr=TRUE)

##Dynamic Test of the long-run equilibrium against hnull=2 with breakpoints
##labelled in the plot:

#ys <- isat(y, sis=TRUE, iis=FALSE, tis=FALSE, t.pval=0.01, ar=1:2)
#isattest(ys, hnull=2, lr=TRUE, ci.pval = 0.99, plot.turn = TRUE, biascorr=FALSE)



