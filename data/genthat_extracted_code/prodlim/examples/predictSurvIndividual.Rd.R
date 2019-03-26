library(prodlim)


### Name: predictSurvIndividual
### Title: Predict individual survival probabilities
### Aliases: predictSurvIndividual
### Keywords: survival

### ** Examples


 SurvFrame <- data.frame(time=1:10,status=rbinom(10,1,.5))
 x <- prodlim(formula=Hist(time=time,status!=0)~1,data=SurvFrame)
 predictSurvIndividual(x,lag=1)




