library(ClassComparison)


### Name: MultiTtest-class
### Title: Class "MultiTtest"
### Aliases: MultiTtest MultiTtest-class hist,MultiTtest-method
###   plot,MultiTtest,missing-method plot,MultiTtest,ANY-method
###   summary,MultiTtest-method as.data.frame,MultiTtest-method
### Keywords: classes multivariate htest

### ** Examples

showClass("MultiTtest")
ng <- 10000
ns <- 50
dat <- matrix(rnorm(ng*ns), ncol=ns)
cla <- factor(rep(c('A', 'B'), each=25))
res <- MultiTtest(dat, cla)
summary(res)
hist(res, breaks=101)
plot(res)
plot(res, res@p.values)
hist(res@p.values, breaks=101)

dat[1,1] <- NA
mm <- matrixMean(dat, na.rm=TRUE)
vv <- matrixVar(dat, mm, na.rm=TRUE)
tt <- matrixT(dat, cla, na.rm=TRUE)
mtt <- MultiTtest(dat,cla)



