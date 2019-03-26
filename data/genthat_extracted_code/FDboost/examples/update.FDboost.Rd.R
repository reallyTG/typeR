library(FDboost)


### Name: update.FDboost
### Title: Function to update FDboost objects
### Aliases: update.FDboost

### ** Examples

######## Example from \code{?FDboost}
data("viscosity", package = "FDboost") 
## set time-interval that should be modeled
interval <- "101"

## model time until "interval" and take log() of viscosity
end <- which(viscosity$timeAll == as.numeric(interval))
viscosity$vis <- log(viscosity$visAll[,1:end])
viscosity$time <- viscosity$timeAll[1:end]
# with(viscosity, funplot(time, vis, pch = 16, cex = 0.2))

mod1 <- FDboost(vis ~ 1 + bolsc(T_C, df = 2) + bolsc(T_A, df = 2),
               timeformula = ~ bbs(time, df = 4),
               numInt = "equal", family = QuantReg(),
               offset = NULL, offset_control = o_control(k_min = 9),
               data = viscosity, control=boost_control(mstop = 10, nu = 0.4))
               
# update nu
mod2 <- update(mod1, control=boost_control(nu = 1)) # mstop will stay the same
# update mstop
mod3 <- update(mod2, control=boost_control(mstop = 100)) # nu=1 does not get changed
mod4 <- update(mod1, formula = vis ~ 1 + bolsc(T_C, df = 2)) # drop one term



