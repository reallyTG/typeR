library(FDboost)


### Name: stabsel.FDboost
### Title: Stability Selection
### Aliases: stabsel.FDboost

### ** Examples

######## Example for function-on-scalar-regression
data("viscosity", package = "FDboost")
## set time-interval that should be modeled
interval <- "101"

## model time until "interval" and take log() of viscosity
end <- which(viscosity$timeAll == as.numeric(interval))
viscosity$vis <- log(viscosity$visAll[,1:end])
viscosity$time <- viscosity$timeAll[1:end]
# with(viscosity, funplot(time, vis, pch = 16, cex = 0.2))

## fit a model cotaining all main effects 
modAll <- FDboost(vis ~ 1 
          + bolsc(T_C, df=1) %A0% bbs(time, df=5) 
          + bolsc(T_A, df=1) %A0% bbs(time, df=5)
          + bolsc(T_B, df=1) %A0% bbs(time, df=5)
          + bolsc(rspeed, df=1) %A0% bbs(time, df=5)
          + bolsc(mflow, df=1) %A0% bbs(time, df=5), 
       timeformula = ~bbs(time, df=5), 
       numInt = "Riemann", family = QuantReg(), 
       offset = NULL, offset_control = o_control(k_min = 10),
       data = viscosity, 
       control = boost_control(mstop = 100, nu = 0.2))


## create folds for stability selection  
## only 5 folds for a fast example, usually use 50 folds 
set.seed(1911)
folds <- cvLong(modAll$id, weights = rep(1, l = length(modAll$id)), 
                type = "subsampling", B = 5) 
    
## Not run: 
##D         
##D ## stability selection with refit of the smooth intercept 
##D stabsel_parameters(q = 3, PFER = 1, p = 6, sampling.type = "SS")
##D sel1 <- stabsel(modAll, q = 3, PFER = 1, folds = folds, grid = 1:200, sampling.type = "SS")
##D sel1
##D 
##D ## stability selection without refit of the smooth intercept 
##D sel2 <- stabsel(modAll, refitSmoothOffset = FALSE, q = 3, PFER = 1, 
##D                 folds = folds, grid = 1:200, sampling.type = "SS")
##D sel2
## End(Not run)




