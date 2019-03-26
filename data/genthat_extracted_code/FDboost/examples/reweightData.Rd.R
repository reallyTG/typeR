library(FDboost)


### Name: reweightData
### Title: Function to Reweight Data
### Aliases: reweightData

### ** Examples

## load data
data("viscosity", package = "FDboost")
interval <- "101"
end <- which(viscosity$timeAll == as.numeric(interval))
viscosity$vis <- log(viscosity$visAll[ , 1:end])
viscosity$time <- viscosity$timeAll[1:end]

## what does data look like
str(viscosity)

## do some reweighting
# correct weights
str(reweightData(viscosity, vars=c("vis", "T_C", "T_A", "rspeed", "mflow"), 
    argvals = "time", weights = c(0, 32, 32, rep(0, 61))))

str(visNew <- reweightData(viscosity, vars=c("vis", "T_C", "T_A", "rspeed", "mflow"), 
    argvals = "time", weights = c(0, 32, 32, rep(0, 61))))
# check the result
# visNew$vis[1:5, 1:5] ## image(visNew$vis)

# incorrect weights
str(reweightData(viscosity, vars=c("vis", "T_C", "T_A", "rspeed", "mflow"), 
    argvals = "time", weights = sample(1:64, replace = TRUE)), 1)

# supply meaningful index
str(visNew <- reweightData(viscosity, vars = c("vis", "T_C", "T_A", "rspeed", "mflow"), 
              argvals = "time", index = rep(1:32, each = 2)))
# check the result
# visNew$vis[1:5, 1:5]

# errors
if(FALSE){
   reweightData(viscosity, argvals = "")
   reweightData(viscosity, argvals = "covThatDoesntExist", index = rep(1,64))
   }
   



