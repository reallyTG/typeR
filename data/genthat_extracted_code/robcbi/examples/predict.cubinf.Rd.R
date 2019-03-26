library(robcbi)


### Name: predict.cubinf
### Title: Prediction methods for objects of class "cubinf"
### Aliases: predict.cubinf
### Keywords: stats robust

### ** Examples

 library(robcbi)
 data(Finney)
 Vol <- Finney$Vol; Rate <- Finney$Rate; Resp <- Finney$Resp
 df <- data.frame(lVol = log(Vol), lRate = log(Rate), Resp = Resp)
 z.cub <- glm(Resp~lVol+lRate,family=binomial,data=df,method="cubinf",ufact=3.2)
 set.seed(123)
 rVol  <- runif(20,0.4,3.7); rRate <- runif(20,0.3,3.75)
 newdat <- data.frame(lVol=log(rVol),lRate=log(rRate))
 predict(z.cub, newdat, type="response")



