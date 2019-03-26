library(kequate)


### Name: PREp
### Title: Percent Relative Error
### Aliases: PREp

### ** Examples

P<-c(5, 20, 35, 25, 15)
Q<-c(10, 30, 30, 20, 10)
x<-0:4
glmx<-glm(P~I(x)+I(x^2), family="poisson", x=TRUE)
glmy<-glm(Q~I(x)+I(x^2), family="poisson", x=TRUE)
keEG<-kequate("EG", 0:4, 0:4, glmx, glmy)
PREp(getEq(keEG), 0:4, glmx$fitted.values/100, glmy$fitted.values/100)



