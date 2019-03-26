library(FDboost)


### Name: %Xc%
### Title: Constrained row tensor product
### Aliases: %Xc%

### ** Examples

 
######## Example for function-on-scalar-regression with interaction effect of two scalar covariates 
data("viscosity", package = "FDboost") 
## set time-interval that should be modeled
interval <- "101"

## model time until "interval" and take log() of viscosity
end <- which(viscosity$timeAll == as.numeric(interval))
viscosity$vis <- log(viscosity$visAll[,1:end])
viscosity$time <- viscosity$timeAll[1:end]
# with(viscosity, funplot(time, vis, pch = 16, cex = 0.2))

## fit model with interaction that is centered around the intercept 
## and the two main effects 
mod1 <- FDboost(vis ~ 1 + bolsc(T_C, df=1) + bolsc(T_A, df=1) + 
                bols(T_C, df=1) %Xc% bols(T_A, df=1),
                timeformula = ~bbs(time, df=6),
                numInt = "equal", family = QuantReg(),
                offset = NULL, offset_control = o_control(k_min = 9),
                data = viscosity, control=boost_control(mstop = 100, nu = 0.4))
                
## check centering around intercept
colMeans(predict(mod1, which = 4))

## check centering around main effects
colMeans(predict(mod1, which = 4)[viscosity$T_A == "low", ])
colMeans(predict(mod1, which = 4)[viscosity$T_A == "high", ])
colMeans(predict(mod1, which = 4)[viscosity$T_C == "low", ])
colMeans(predict(mod1, which = 4)[viscosity$T_C == "low", ])

## find optimal mstop using cvrsik() or validateFDboost()
## ... 

## look at interaction effect in one plot
# funplot(mod1$yind, predict(mod1, which=4))




