library(supportInt)


### Name: glmLikSI
### Title: Profile support intervals for glm coefficients
### Aliases: glmLikSI
### Keywords: ~kwd1 ~kwd2

### ** Examples

set.seed(10)
x <- rnorm(50, 0 , 5)
expit <- function(z) exp(z)/(1+exp(z))
p <- expit(.1+ .4*x)
y <- sapply(1:length(p), function(z) rbinom(1,1, p[z]))
glm.obj <- glm(y~x, family="binomial")
glmLikSI(glm.obj, 8)



