library(FDboost)


### Name: anisotropic_Kronecker
### Title: Kronecker product or row tensor product of two base-learners
###   with anisotropic penalty
### Aliases: anisotropic_Kronecker %A% %A0% %Xa0%

### ** Examples

 
######## Example for anisotropic penalty  
data("viscosity", package = "FDboost") 
## set time-interval that should be modeled
interval <- "101"

## model time until "interval" and take log() of viscosity
end <- which(viscosity$timeAll == as.numeric(interval))
viscosity$vis <- log(viscosity$visAll[,1:end])
viscosity$time <- viscosity$timeAll[1:end]
# with(viscosity, funplot(time, vis, pch = 16, cex = 0.2))

## isotropic penalty, as timeformula is kroneckered to each effect using %O% 
## only for the smooth intercept %A0% is used, as 1-direction should not be penalized 
mod1 <- FDboost(vis ~ 1 + 
                bolsc(T_C, df = 1) + 
                bolsc(T_A, df = 1) + 
                bols(T_C, df = 1) %Xc% bols(T_A, df = 1),
                timeformula = ~ bbs(time, df = 3),
                numInt = "equal", family = QuantReg(),
                offset = NULL, offset_control = o_control(k_min = 9),
                data = viscosity, control=boost_control(mstop = 100, nu = 0.4))
## cf. the formula that is passed to mboost
mod1$formulaMboost

## anisotropic effects using %A0%, as lambda1 = 0 for all base-learners
## in this case using %A% gives the same model, but three lambdas are computed explicitly 
mod1a <- FDboost(vis ~ 1 + 
                bolsc(T_C, df = 1) %A0% bbs(time, df = 3) + 
                bolsc(T_A, df = 1) %A0% bbs(time, df = 3) + 
                bols(T_C, df = 1) %Xc% bols(T_A, df = 1) %A0% bbs(time, df = 3),
                timeformula = ~ bbs(time, df = 3),
                numInt = "equal", family = QuantReg(),
                offset = NULL, offset_control = o_control(k_min = 9),
                data = viscosity, control=boost_control(mstop = 100, nu = 0.4)) 
## cf. the formula that is passed to mboost
mod1a$formulaMboost

## alternative model specification by using a 0-matrix as penalty 
## only works for bolsc() as in bols() one cannot specify K 
## -> model without interaction term 
K0 <- matrix(0, ncol = 2, nrow = 2)
mod1k0 <- FDboost(vis ~ 1 + 
                 bolsc(T_C, df = 1, K = K0) +
                 bolsc(T_A, df = 1, K = K0), 
                 timeformula = ~ bbs(time, df = 3), 
                 numInt = "equal", family = QuantReg(), 
                 offset = NULL, offset_control = o_control(k_min = 9), 
                 data = viscosity, control=boost_control(mstop = 100, nu = 0.4))
## cf. the formula that is passed to mboost
mod1k0$formulaMboost
                
## optimize mstop for mod1, mod1a and mod1k0
## ...
                
## compare estimated coefficients
## Not run: 
##D par(mfrow=c(4, 2))
##D plot(mod1, which = 1)
##D plot(mod1a, which = 1)
##D plot(mod1, which = 2)
##D plot(mod1a, which = 2)
##D plot(mod1, which = 3)
##D plot(mod1a, which = 3)
##D funplot(mod1$yind, predict(mod1, which=4))
##D funplot(mod1$yind, predict(mod1a, which=4))
## End(Not run)




