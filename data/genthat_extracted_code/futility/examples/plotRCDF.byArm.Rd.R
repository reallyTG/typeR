library(futility)


### Name: plotRCDF.byArm
### Title: Plot Characteristics of the Estimated Distribution of the
###   Treatment Arm-Specific Number of Endpoints
### Aliases: plotRCDF.byArm

### ** Examples

arm <- rep(c("C3","T1","T2"), each=250)
schedule <- rbinom(length(arm), 1, 0.01)
entry <- rpois(length(arm), lambda=60)
entry <- entry - min(entry)
last_visit_dt <- entry + runif(length(arm), min=0, max=80)
event <- rbinom(length(arm), 1, 0.01)
dropout <- rbinom(length(arm), 1, 0.02)
dropout[event==1] <- 0
exit <- rep(NA, length(arm))
exit[event==1] <- last_visit_dt[event==1] + 5
exit[dropout==1] <- last_visit_dt[dropout==1] + 5
followup <- ifelse(event==1 | dropout==1, 0, 1)
interimData <- data.frame(arm=arm, schedule2=schedule, entry=entry, exit=exit,
last_visit_dt=last_visit_dt, event=event, dropout=dropout, complete=0, followup=followup)

weights <- c(0.2, 0.4, 0.6)
for (j in 1:length(weights)){
  completeTrial.byArm(interimData=interimData, nTrials=50,
  trtNames=c("C3","T1","T2"),N=c(500,500,500),
  enrollRatePeriod=24, eventPriorWeight=weights[j], eventPriorRate=c(0.06,0.03,0.03),
  fuTime=80, visitSchedule=seq(0, 80, by=4), visitSchedule2=c(0,seq(from=8,to=80,by=12)),
  saveDir="./", randomSeed=9)
}

pdf(file=paste0("./","rcdf_byArm_arm=T1_",
"eventPriorRateC3=0.06_eventPriorRateT1=0.03_eventPriorRateT2=0.03.pdf"), width=6,
height=5)
plotRCDF.byArm(arm="T1", eventPriorRate=c(0.06,0.03,0.03), eventPriorWeight=weights,
fileDir="./")
dev.off()




