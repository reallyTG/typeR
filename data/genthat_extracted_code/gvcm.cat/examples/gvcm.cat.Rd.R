library(gvcm.cat)


### Name: gvcm.cat
### Title: Regularized Categorical Effects/Categorical Effect
###   Modifiers/Continuous/Smooth effects in GLMs
### Aliases: gvcm.cat pest abc print.gvcm.cat summary.gvcm.cat

### ** Examples

## example for function simulation()
covariates <- list(x1=list("unif", c(0,2)),
                  x2=list("unif", c(0,2)),
                  x3=list("unif", c(0,2)),
                  u=list("multinom",c(0.3,0.4,0.3), "nominal")
                  )
true.f <- y ~ 1 + v(x1,u) + x2
true.coefs <- c(0.2,  0.3,.7,.7, -.5)
data <- simulation(400, covariates, NULL, true.f, true.coefs , binomial(), seed=456)
## example for function gvcm.cat()
f <- y ~ v(1,u) + v(x1,u) + v(x2,u)
m1 <- gvcm.cat(f, data, binomial(), plot=TRUE, control=cat_control(lambda.upper=19))
summary(m1)
## example for function predict.gvcm.cat
newdata <- simulation(200, covariates, NULL, true.f, true.coefs , binomial(), seed=789)
prediction <- predict.gvcm.cat(m1, newdata) 
## example for function plot.gvcm.cat 
plot(m1)
plot(m1, type="score")
plot(m1, type="coefs")



