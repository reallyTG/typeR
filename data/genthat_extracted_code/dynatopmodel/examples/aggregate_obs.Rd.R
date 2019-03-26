library(dynatopmodel)


### Name: aggregate_obs
### Title: Resample observation data at a new time interval
### Aliases: aggregate_obs

### ** Examples

# Resample Brompton rainfall and PE data to 15 minute intervals
require(dynatopmodel)
data("brompton")

obs <- aggregate_obs(list("rain"=brompton$rain, "pe"=brompton$pe), dt=15/60)

# check totals for Sept - Oct 2012
sum(obs$rain*15/60, na.rm=TRUE)
sum(brompton$rain, na.rm=TRUE)




