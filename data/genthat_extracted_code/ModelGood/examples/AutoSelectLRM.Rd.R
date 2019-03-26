library(ModelGood)


### Name: AutoSelectLRM
### Title: Automated backward elemination for logistic regression
### Aliases: AutoSelectLRM

### ** Examples

library(rms)
set.seed(7)
x <- abs(rnorm(20))
d <- data.frame(y=rbinom(20,1,x/max(x)),x=x,z=rnorm(20))
fbw <- AutoSelectLRM(y~x+z,d)
predictStatusProb(fbw,newdata=d[1:3,])



