library(multgee)


### Name: waldts
### Title: Wald Test of Nested GEE Models
### Aliases: waldts

### ** Examples

data(housing)
set.seed(1)
fitmod1 <- nomLORgee(y~factor(time)*sec,data=housing,id=id,repeated=time)
set.seed(1)
fitmod0 <- update(fitmod1,formula=y~factor(time)+sec)
waldts(fitmod0,fitmod1)



