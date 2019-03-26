library(FSA)


### Name: bootstrap
### Title: Case bootstrapping and associated S3 methods.
### Aliases: bootstrap bootCase confint.bootCase htest.bootCase
###   hist.bootCase plot.bootCase predict.bootCase
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
nl1.bootc <- bootCase(nl1,coef,B=99)  # B=99 too few to be useful
confint(nl1.bootc,"B1")
confint(nl1.bootc,c(2,3))
confint(nl1.bootc,conf.level=0.90)
confint(nl1.bootc,plot=TRUE)
predict(nl1.bootc,fnx,days=1:3)
predict(nl1.bootc,fnx,days=3)
htest(nl1.bootc,1,bo=6,alt="less")
hist(nl1.bootc)
plot(nl1.bootc)
cor(nl1.bootc)




