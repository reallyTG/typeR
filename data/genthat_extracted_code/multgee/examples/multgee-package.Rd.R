library(multgee)


### Name: multgee-package
### Title: A GEE Solver For Correlated Nominal Or Ordinal Multinomial
###   Responses
### Aliases: multgee
### Keywords: package

### ** Examples

data(arthritis)
fitord <- ordLORgee(y~factor(time)+factor(trt)+factor(baseline), data=arthritis,
          id=id, repeated=time)
summary(fitord) 

data(housing)
fitnom <- nomLORgee(y~factor(time)*sec, data=housing, id=id, repeated=time)
summary(fitnom) 



