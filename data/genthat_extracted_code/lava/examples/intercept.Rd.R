library(lava)


### Name: intercept
### Title: Fix mean parameters in 'lvm'-object
### Aliases: intercept intercept<- intercept.lvm intercept<-.lvm intfix
###   intfix<- intfix.lvm intfix<-.lvm
### Keywords: models regression

### ** Examples



## A multivariate model
m <- lvm(c(y1,y2) ~ f(x1,beta)+x2)
regression(m) <- y3 ~ f(x1,beta)
intercept(m) <- y1 ~ f(mu)
intercept(m, ~y2+y3) <- list(2,"mu")
intercept(m) ## Examine intercepts of model (NA translates to free/unique paramete##r)





