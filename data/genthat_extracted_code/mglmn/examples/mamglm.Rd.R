library(mglmn)


### Name: mamglm
### Title: Model averaging for multivariate generalized linear models
### Aliases: mamglm
### Keywords: ~kwd1 ~kwd2

### ** Examples

#load species composition and environmental data
data(capcay)
#use a subset of data in this example to reduce run time
env_assem <- capcay$env_assem[,1:5]
freq.abs <- mvabund(log(capcay$abund+1))

#to fit a gaussian regression model to frequency data:
mamglm(data=env_assem,y="freq.abs",family="gaussian")

#to fit a binomial regression model to presence/absence data"
pre.abs0 <- capcay$abund
pre.abs0[pre.abs0>0] = 1
pre.abs <- mvabund(pre.abs0)

mamglm(data=env_assem,y="pre.abs",family="binomial")




