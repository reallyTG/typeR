library(wevid)


### Name: summary-densities
### Title: Summary evaluation of predictive performance
### Aliases: summary-densities summary.Wdensities mean.Wdensities
###   auroc.crude auroc.model lambda.crude lambda.model

### ** Examples

data(cleveland)
densities <- with(cleveland, Wdensities(y, posterior.p, prior.p))

summary(densities)
mean(densities)
auroc.model(densities)
lambda.model(densities)




