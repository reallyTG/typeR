library(exactRankTests)


### Name: lungcancer
### Title: Lung Cancer Clinical Trial
### Aliases: lungcancer
### Keywords: datasets

### ** Examples

data(lungcancer)
attach(lungcancer)

# round logrank scores
scores <- cscores.Surv(cbind(time, cens))
T <- sum(scores[group=="newdrug"])
mobs <- sum(group=="newdrug")
system.time(prob <- pperm(T, scores, m=mobs, al="le"))
prob
pperm(T, scores, m=mobs, al="tw")
pperm(T, scores, m=mobs, al="tw", simulate=TRUE)

# map into integers, faster
scores <- cscores.Surv(cbind(time, cens), int=TRUE)
T <- sum(scores[group=="newdrug"])
mobs <- sum(group=="newdrug")
system.time(prob <- pperm(T, scores, m=mobs, al="le"))
prob
pperm(T, scores, m=mobs, al="tw")
pperm(T, scores, m=mobs, al="tw", simulate=TRUE)

detach(lungcancer)




