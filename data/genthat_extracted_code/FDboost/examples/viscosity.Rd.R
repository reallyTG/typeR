library(FDboost)


### Name: viscosity
### Title: Viscosity of resin over time
### Aliases: viscosity
### Keywords: datasets

### ** Examples


 data("viscosity", package = "FDboost")
 ## set time-interval that should be modeled
 interval <- "101"

 ## model time until "interval" and take log() of viscosity
 end <- which(viscosity$timeAll==as.numeric(interval))
 viscosity$vis <- log(viscosity$visAll[,1:end])
 viscosity$time <- viscosity$timeAll[1:end]
 # with(viscosity, funplot(time, vis, pch=16, cex=0.2))

 ## fit median regression model with 100 boosting iterations,
 ## step-length 0.4 and smooth time-specific offset
 ## the factors are in effect coding -1, 1 for the levels
 mod <- FDboost(vis ~ 1 + bols(T_C, contrasts.arg = "contr.sum", intercept=FALSE)
                + bols(T_A, contrasts.arg = "contr.sum", intercept=FALSE),
                timeformula=~bbs(time, lambda=100),
                numInt="equal", family=QuantReg(),
                offset=NULL, offset_control = o_control(k_min = 9),
                data=viscosity, control=boost_control(mstop = 100, nu = 0.4))
 summary(mod)




