library(swissMrP)


### Name: swissMrP
### Title: Multilevel Regression with Poststratification for the 26 Swiss
###   Cantons
### Aliases: swissMrP
### Keywords: MrP poststratification prediction Estimating Public Opinion

### ** Examples

## No test: 
library(lme4)
### Fake data
err.ind <- rnorm(1000,sd=4)
woman <- sample(c(0,1),replace=TRUE,size=1000) 
age <- sample(c(1:4),replace=TRUE,size=1000) 
education <- sample(c(1:6),replace=TRUE,size=1000) 
cantonnr <- sample(c(1:26),replace=TRUE,size=1000) 
region <- sample(c(1:7),replace=TRUE,size=1000) 
x <- cbind(rnorm(26),rnorm(26)); err.con <- rnorm(26,sd=4); X <- matrix(NA,1000,2)
for (q in 1:1000){ X[q,] <- c(x[cantonnr[q]],err.con[cantonnr[q]])}
y.fake <- X[,1] +X[,2] + woman+age+education+cantonnr+region + err.ind
y <- rep(0,length(y.fake))
y[y.fake>mean(y.fake)]<-1
model1 <- glmer(y ~ X[,1] +X[,2] + (1|woman)  + (1|education) + (1|age) + (1|cantonnr) 
                + (1|region), family=binomial(probit))
# use the MrP function
mrp1 <- swissMrP(model1)

## Here is an example if two cantons (10,22; FR & VD) are missing
mrp2 <- swissMrP(model1,
			augment.data=matrix(c(c(1,2,-1),c(1,1,-5)),2,3, byrow=TRUE),
			augment.row=c(10,22))
## End(No test)



