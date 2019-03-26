library(rsq)


### Name: lifetime
### Title: Lifetimes in Two Different Environments.
### Aliases: lifetime
### Keywords: datasets

### ** Examples

data(lifetime)
summary(lifetime)
head(lifetime)

attach(lifetime)
igfit <- glm(time~env,family=inverse.gaussian)
rsq(igfit)
rsq(igfit,adj=TRUE)

rsq.partial(igfit)



