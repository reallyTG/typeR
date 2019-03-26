library(BOIN)


### Name: get.oc
### Title: Generate operating characteristics for single agent trials
### Aliases: get.oc

### ** Examples


## get the operating characteristics for BOIN single agent trial
oc <- get.oc(target=0.3, p.true=c(0.05, 0.15, 0.3, 0.45, 0.6),
			ncohort=20, cohortsize=3, ntrial=1000)

summary.boin(oc)          # summarize design operating characteristics
plot.boin(oc$selpercent)  # plot selection percentage
plot.boin(oc$npatients)   # plot the number of patients at each dose
plot.boin(oc$ntox)        # plot the number of toxicities at each dose
# plot.boin(oc$flowchart)   # plot flowchart of the BOIN design


## perform titration at the begining of the trial to accelerate dose escalation
oc <- get.oc(target=0.3, p.true=c(0.05, 0.15, 0.3, 0.45, 0.6),
			titration=TRUE, ncohort=20, cohortsize=3, ntrial=1000)

summary.boin(oc)          # summarize design operating characteristics
plot.boin(oc$selpercent)  # plot selection percentage
plot.boin(oc$npatients)   # plot the number of patients at each dose
plot.boin(oc$ntox)        # plot the number of toxicities at each dose
# plot.boin(oc$flowchart)   # plot flowchart of the BOIN design





