library(FitAR)


### Name: SelectModel
### Title: Select Best AR, ARz or ARp Model
### Aliases: SelectModel
### Keywords: ts

### ** Examples

#Example 1: Find an ARp subset model for lynx data using BIC
z<-log(lynx)
out<-SelectModel(z, ARModel="ARp", Criterion="BIC", Best=5)
plot(out)
#
#Example 2: Find an ARz subset model for lynx data using BIC
out<-SelectModel(z, ARModel="ARz", Criterion="BIC", Best=5)
plot(out)
#
#Example 3: Select an AR(p) model
out<-SelectModel(z, ARModel="AR", Criterion="BIC", Best=5)
out
plot(out)
out<-SelectModel(z, ARModel="AR", Criterion="BIC", Best=1)
#
#Example 4: Fit subset models to lynx series
z<-log(lynx)
#requires library leaps. Should be automatically when FitAR package is loaded.
#first fit ARp
pvec <- SelectModel(z, lag.max=11, ARModel="ARp", Criterion="AIC", Best=1)
ans1 <- FitAR(z, pvec, ARModel="ARp", MLEQ=FALSE)
#now fit ARz
pvec <- SelectModel(z, lag.max=11, ARModel="ARz", Criterion="AIC", Best=1)
ans2<-FitAR(z, pvec, ARModel="ARz")
#compare
summary(ans1)
summary(ans2)
#Use UBIC
pvec <- SelectModel(z, ARModel="ARp",lag.max=11,Best=1)
ans3<-FitAR(z, pvec, ARModel="ARp")
pvec <- SelectModel(z, ARModel="ARz",lag.max=11,Best=1)
ans4<-FitAR(z, pvec, ARModel="ARz")
#compare
summary(ans3)
summary(ans4)
#
#Example 5: lynx data subset AR models
#The AIC and BIC choose the same models as the GIC with t=0.1 and t=0.01 respectively.
#An even more parsimonious model is chosen with t=0.001
SelectModel(z, lag.max=15, ARModel="ARp", Criterion="GIC", Best=1, Candidates=5, t=0.1)
SelectModel(z, lag.max=15, ARModel="ARp", Criterion="GIC", Best=1, Candidates=5, t=0.01)
SelectModel(z, lag.max=15, ARModel="ARp", Criterion="GIC", Best=1, Candidates=5, t=0.001)
ans<-SelectModel(z, lag.max=15, ARModel="ARp", Criterion="GIC", Best=3, Candidates=5, t=0.001)
plot(ans)



