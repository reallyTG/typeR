library(futility)


### Name: completeTrial.byArm
### Title: Treatment Arm-Specific Simulation-Based Completion of a
###   Randomized Efficacy Trial with a Time-to-Event Endpoint and Fixed
###   Follow-up Using an Interim Data-set
### Aliases: completeTrial.byArm

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

completeData <- completeTrial.byArm(interimData=interimData, nTrials=5,
trtNames=c("C3","T1","T2"), N=c(500,500,500), enrollRatePeriod=24, eventPriorWeight=0.5,
eventPriorRate=c(0.001,0.0004,0.0004), fuTime=80, visitSchedule=seq(0, 80, by=4),
visitSchedule2=c(0,seq(from=8,to=80,by=12)), randomSeed=9)
### alternatively, to save the .RData output file (no '<-' needed):
completeTrial.byArm(interimData=interimData, nTrials=5, trtNames=c("C3","T1","T2"),
N=c(500,500,500), enrollRatePeriod=24, eventPriorWeight=0.5,
eventPriorRate=c(0.001,0.0004,0.0004), fuTime=80, visitSchedule=seq(0, 80, by=4),
visitSchedule2=c(0,seq(from=8,to=80,by=12)), saveDir="./", randomSeed=9)




