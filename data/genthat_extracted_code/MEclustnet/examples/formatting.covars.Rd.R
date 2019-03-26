library(MEclustnet)


### Name: formatting.covars
### Title: Reformat matrix of covariates.
### Aliases: formatting.covars
### Keywords: methods cluster multivariate

### ** Examples

data(us.twitter.covariates)
link.vars = c(1)
mix.vars = c(1,5,7,8)
res = formatting.covars(us.twitter.covariates, link.vars, mix.vars, nrow(us.twitter.covariates))
dim(res$x.link)
dim(res$x.mix)



