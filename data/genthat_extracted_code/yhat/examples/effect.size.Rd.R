library(yhat)


### Name: effect.size
### Title: Effect Size Computation for lm
### Aliases: effect.size

### ** Examples

     require ("MBESS")
     data(HS.data)
     attach(HS.data)
     lm.out<-lm(deduct~addition*arithmet)
     effect.size(lm.out)
     detach(HS.data)



