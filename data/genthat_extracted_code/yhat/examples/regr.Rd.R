library(yhat)


### Name: regr
### Title: Regression effect reporting for lm class objects
### Aliases: regr

### ** Examples

     require("MBESS")
     data(HS.data)
     attach(HS.data)
     lm.out<-lm(deduct~addition*arithmet)
     regr(lm.out)
     detach(HS.data)



