library(abc)


### Name: abc
### Title: Parameter estimation with Approximate Bayesian Computation (ABC)
### Aliases: abc abc.return
### Keywords: htest models neural

### ** Examples

require(abc.data)
data(musigma2)
?musigma2

## The rejection algorithm
##
rej <- abc(target=stat.obs, param=par.sim, sumstat=stat.sim, tol=.1, method =
"rejection") 

## ABC with local linear regression correction without/with correction
## for heteroscedasticity 
##
lin <- abc(target=stat.obs, param=par.sim, sumstat=stat.sim, tol=.1, hcorr =
FALSE, method = "loclinear", transf=c("none","log"))
linhc <- abc(target=stat.obs, param=par.sim, sumstat=stat.sim, tol=.1, method =
"loclinear", transf=c("none","log")) 

## posterior summaries
##
linsum <- summary(linhc, intvl = .9)
linsum
## compare with the rejection sampling
summary(linhc, unadj = TRUE, intvl = .9)

## posterior histograms
##
hist(linhc, breaks=30, caption=c(expression(mu),
expression(sigma^2))) 

## or send histograms to a pdf file
hist(linhc, file="linhc", breaks=30, caption=c(expression(mu),
expression(sigma^2)))

## diagnostic plots: compare the 2 'abc' objects: "loclinear",
## "loclinear" with correction for heteroscedasticity
##
plot(lin, param=par.sim)
plot(linhc, param=par.sim)

## example illustrates how to add "true" parameter values to a plot
##
postmod <- c(post.mu[match(max(post.mu[,2]), post.mu[,2]),1],
             post.sigma2[match(max(post.sigma2[,2]), post.sigma2[,2]),1])
plot(linhc, param=par.sim, true=postmod)


## artificial example to show how to use the logit tranformations
##
myp <- data.frame(par1=runif(1000,-1,1),par2=rnorm(1000),par3=runif(1000,0,2))
mys <- myp+rnorm(1000,sd=.1)
myt <- c(0,0,1.5)
lin2 <- abc(target=myt, param=myp, sumstat=mys, tol=.1, method =
"loclinear", transf=c("logit","none","logit"),logit.bounds = rbind(c(-1,
1), c(NA, NA), c(0, 2)))
summary(lin2)



