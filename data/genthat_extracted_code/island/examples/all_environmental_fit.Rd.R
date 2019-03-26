library(island)


### Name: all_environmental_fit
### Title: Environmental fit for a single dataset
### Aliases: all_environmental_fit custom_environmental_fit NLL_env
###   greedy_environmental_fit

### ** Examples

## Not run: 
##D all_environmental_fit(idaho[[1]],3:23,c("idaho[[2]]$TOTAL.ppt",
##D "idaho[[2]]$ANNUAL.temp"),0.13,0.19,100000)
##D greedy_environmental_fit(idaho[[1]],3:23,c("idaho[[2]]$TOTAL.ppt",
##D "idaho[[2]]$ANNUAL.temp"),0.13,0.19,100000)
## End(Not run)
custom_environmental_fit(idaho[[1]], 3:23, c(-0.00497925, -0.01729602,
0.19006501, 0.93486956), expression(params[1] * idaho[[2]]$TOTAL.ppt[i] +
params[3]), expression(params[2] * idaho[[2]]$ANNUAL.temp[i] + params[4]))
NLL_env(idaho[[1]], 3:23, c(-0.00497925, -0.01729602,
0.19006501, 0.93486956), expression(params[1] * idaho[[2]]$TOTAL.ppt[i] +
params[3]), expression(params[2] * idaho[[2]]$ANNUAL.temp[i] + params[4]))




