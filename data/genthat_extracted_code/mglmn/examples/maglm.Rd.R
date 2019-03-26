library(mglmn)


### Name: maglm
### Title: Model averaging for generalized linear models
### Aliases: maglm
### Keywords: ~kwd1 ~kwd2

### ** Examples

#load sspecies composition and environmental data
data(capcay)
adj.sr <- capcay$adj.sr
env_sp <- capcay$env_sp

#to fit a regression model:
maglm(data=env_sp, y="adj.sr", family="gaussian",AIC.restricted=TRUE)




