library(vtreat)


### Name: kWayStratifiedYReplace
### Title: k-fold cross validation stratified with replacement on y, a
###   splitFunction in the sense of vtreat::buildEvalSets .
### Aliases: kWayStratifiedYReplace

### ** Examples


set.seed(23255)
d <- data.frame(y=sin(1:100))
pStrat <- kWayStratifiedYReplace(nrow(d),5,d,d$y)




