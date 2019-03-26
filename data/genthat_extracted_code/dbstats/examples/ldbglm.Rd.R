library(dbstats)


### Name: ldbglm
### Title: Local distance-based generalized linear model
### Aliases: ldbglm ldbglm.formula ldbglm.dist ldbglm.D2 ldbglm.Gram
###   print.ldbglm

### ** Examples


# example of ldbglm usage
 z <- rnorm(100)
 y <- rbinom(100, 1, plogis(z))
 D2 <- as.matrix(dist(z))^2
 class(D2) <- "D2"
 
 # Distance-based generalized linear model
 dbglm2 <- dbglm(D2,y,family=binomial(link = "logit"), method="rel.gvar")
 # Local Distance-based generalized linear model
 ldbglm2 <- ldbglm(D2,y=y,family=binomial(link = "logit"),noh=3)
 
 # check the difference of both
 sum((y-ldbglm2$fit)^2)
 sum((y-dbglm2$fit)^2)
 plot(z,y)
 points(z,ldbglm2$fit,col=3)
 points(z,dbglm2$fit,col=2) 
 
 



