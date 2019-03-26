library(repeated)


### Name: glmm
### Title: Generalized Linear Mixed Models
### Aliases: glmm
### Keywords: models

### ** Examples


# Poisson counts
nest <- gl(5,4)
y <- rpois(20,5+2*as.integer(nest))
# overdispersion model
glmm(y~1, family=poisson, nest=gl(20,1), points=3)
# clustered model
glmm(y~1, family=poisson, nest=nest, points=3)
#
# binomial data with model for overdispersion
df <- data.frame(r=rbinom(10,10,0.5), n=rep(10,10), x=c(rep(0,5),
	rep(1,5)), nest=1:10)
glmm(cbind(r,n-r)~x, family=binomial, nest=nest, data=df)




