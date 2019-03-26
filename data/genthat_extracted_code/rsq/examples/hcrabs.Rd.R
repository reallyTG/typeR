library(rsq)


### Name: hcrabs
### Title: Satellites of Female Horseshoe Crabs
### Aliases: hcrabs
### Keywords: datasets

### ** Examples

data(hcrabs)
summary(hcrabs)
head(hcrabs)

attach(hcrabs)
y <- ifelse(num.satellites>0,1,0)
bnfit <- glm(y~color+spine+width+weight,family=binomial)
rsq(bnfit)
rsq(bnfit,adj=TRUE)
rsq.partial(bnfit)

quasips <- glm(num.satellites~color+spine+width+weight,family=quasipoisson)
rsq(quasips)
rsq(quasips,adj=TRUE)
rsq.partial(quasips)



