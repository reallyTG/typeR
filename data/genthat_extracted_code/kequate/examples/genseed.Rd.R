library(kequate)


### Name: genseed
### Title: Standard Error of the Difference Between Two Equating Functions
### Aliases: genseed

### ** Examples

P<-c(5, 20, 35, 25, 15)
Q<-c(10, 30, 30, 20, 10)
x<-0:4
glmx<-glm(P~I(x)+I(x^2), family="poisson", x=TRUE)
glmy<-glm(Q~I(x)+I(x^2), family="poisson", x=TRUE)
keEG<-kequate("EG", 0:4, 0:4, glmx, glmy)
keEGnew<-kequate("EG", 0:4, 0:4, glmx, glmy, hx=0.33, hy=0.33)
SEEDEG<-genseed(keEG, keEGnew)
plot(SEEDEG)



