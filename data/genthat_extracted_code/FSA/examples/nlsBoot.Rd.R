library(FSA)


### Name: confint.nlsBoot
### Title: Associated S3 methods for nlsBoot from nlstools.
### Aliases: confint.nlsBoot confint.nlsboot htest.nlsboot predict.nlsbooot
###   predict.nlsBoot htest htest.nlsBoot
### Keywords: htest

### ** Examples

fnx <- function(days,B1,B2,B3) {
  if (length(B1) > 1) {
    B2 <- B1[2]
    B3 <- B1[3]
    B1 <- B1[1]
  }
  B1/(1+exp(B2+B3*days))
}
nl1 <- nls(cells~fnx(days,B1,B2,B3),data=Ecoli,
           start=list(B1=6,B2=7.2,B3=-1.45))
if (require(nlstools)) {
  nl1.bootn <-  nlstools::nlsBoot(nl1,niter=99) # too few to be useful
  confint(nl1.bootn,"B1")
  confint(nl1.bootn,c(2,3))
  confint(nl1.bootn,conf.level=0.90)
  confint(nl1.bootn,plot=TRUE)
  predict(nl1.bootn,fnx,days=3)
  predict(nl1.bootn,fnx,days=1:3)
  htest(nl1.bootn,1,bo=6,alt="less")
}




