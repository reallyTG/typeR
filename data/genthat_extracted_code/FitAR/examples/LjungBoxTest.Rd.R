library(FitAR)


### Name: LjungBoxTest
### Title: Ljung-Box Test for Randomness
### Aliases: LjungBoxTest
### Keywords: ts

### ** Examples

#test goodness-of-fit of AR(2) model fit to log(lynx)
data(lynx)
z<-log(lynx)
ans<-FitAR(z, 1:2)
#notice that the test is also available as a component of the output of FitAR 
ans$LjungBox
#a plot of the test is produced
plot(ans)
#doing the test manually
res<-resid(ans)
LjungBoxTest(res, k=2, lag.max=20, StartLag=5)

#test for subset case
z<-log(lynx)
pvec<-SelectModel(z, ARModel="ARz", Criterion="BIC", lag.max=10, Best=1)
ans<-FitAR(z, pvec)
plot(ans)
res<-resid(ans)
LjungBoxTest(res, k=length(pvec), lag.max=20, StartLag=11)
#test for ARCH effect,
LjungBoxTest(res,SquaredQ=TRUE)




