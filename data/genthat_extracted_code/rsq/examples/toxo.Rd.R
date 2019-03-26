library(rsq)


### Name: toxo
### Title: Toxoplasmosis Test in El Salvador
### Aliases: toxo
### Keywords: datasets

### ** Examples

data(toxo)
summary(toxo)
attach(toxo)

toxofit<-glm(cbind(positive,nsubs-positive)~rainfall+I(rainfall^2)+I(rainfall^3),family=binomial)

rsq(toxofit)
rsq(toxofit,adj=TRUE)
rsq.partial(toxofit)

detach(toxo)



