library(dbstats)


### Name: predict.ldbglm
### Title: Predicted values for a ldbglm object
### Aliases: predict.ldbglm print.predict.ldbglm

### ** Examples


# example to use of the predict.ldbglm function
 z <- rnorm(100)
 y <- rpois(100, exp(1+z))
 glm5 <- glm(y ~z, family=quasi("identity"))
 ldbglm5 <- ldbglm(dist(z),y=y,family=quasi("identity"),noh=3)
 plot(z,y)
 points(z,glm5$fitt,col=2)
 points(z,ldbglm5$fitt,col=3)

 pr_ldbglm5 <- predict(ldbglm5,as.matrix(dist(z)^2),type.pred="response",type.var="D2")
 max(pr_ldbglm5$fit-ldbglm5$fitt)




