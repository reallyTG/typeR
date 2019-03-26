library(PWFSLSmoke)


### Name: skill_ROCPlot
### Title: ROC Plot
### Aliases: skill_ROCPlot

### ** Examples

## Not run: 
##D # Napa Fires -- October, 2017
##D ca <- airnow_load(2017) %>%
##D   monitor_subset(tlim=c(20171001,20171101), stateCodes='CA')
##D Vallejo <- monitor_subset(ca, monitorIDs='060950004_01')
##D Napa <- monitor_subset(ca, monitorIDs='060550003_01')
##D skill_ROCPlot(Vallejo, Napa)
## End(Not run)



