library(eplusr)


### Name: use_eplus
### Title: Configure which version of EnergyPlus to use
### Aliases: use_eplus eplus_config avail_eplus is_avail_eplus

### ** Examples

## Not run: 
##D # add specific version of EnergyPlus
##D use_eplus(8.9)
##D use_eplus("8.8.0")
##D 
##D # get configure data of specific EnergyPlus version if avaiable
##D eplus_config(8.6)
## End(Not run)

# get all versions of avaiable EnergyPlus
avail_eplus()

# check if specific version of EnergyPlus is available
is_avail_eplus(8.5)
is_avail_eplus(8.8)




