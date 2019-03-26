library(kequate)


### Name: getSeed
### Title: Retrieve the Standard Errors of the Difference Between Two
###   Equatings
### Aliases: getSeed getSeed-class getSeed,keout-method

### ** Examples

P<-c(5, 20, 35, 25, 15)
Q<-c(10, 30, 30, 20, 10)
x<-0:4
glmx<-glm(P~I(x)+I(x^2), family="poisson", x=TRUE)
glmy<-glm(Q~I(x)+I(x^2), family="poisson", x=TRUE)
keEG<-kequate("EG", 0:4, 0:4, glmx, glmy)
keEGseed<-getSeed(keEG)
plot(keEGseed)



