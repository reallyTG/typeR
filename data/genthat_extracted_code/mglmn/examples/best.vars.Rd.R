library(mglmn)


### Name: best.vars
### Title: Best variables
### Aliases: best.vars
### Keywords: ~kwd1 ~kwd2

### ** Examples

#load species composition and environmental data
data(capcay)
adj.sr <- capcay$adj.sr
env_sp <- capcay$env_sp

#to fit a poisson regression model:
res <- maglm(data=env_sp, y="adj.sr", family="gaussian")

best.vars(res)




