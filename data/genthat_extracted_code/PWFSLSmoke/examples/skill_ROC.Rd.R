library(PWFSLSmoke)


### Name: skill_ROC
### Title: ROC Curve
### Aliases: skill_ROC

### ** Examples

## Not run: 
##D # Napa Fires -- October, 2017
##D ca <- airnow_load(2017) %>%
##D   monitor_subset(tlim=c(20171001,20171101), stateCodes='CA')
##D Vallejo <- monitor_subset(ca, monitorIDs='060950004_01')
##D Napa <- monitor_subset(ca, monitorIDs='060550003_01')
##D t2 <- AQI$breaks_24[4] # 'Unhealthy'
##D rocList <- skill_ROC(Vallejo, Napa, t1Range=c(0,100), t2=t2)
##D roc <- rocList$roc
##D auc <- rocList$auc
##D plot(roc$TPR ~ roc$FPR, type='S')
##D title(paste0('Area Under Curve = ', format(auc,digits=3)))
## End(Not run)



