library(phase1PRMD)


### Name: RunPRMD
### Title: Implement a Multi-Stage Phase I Dose-Finding Design to recommend
###   dosage selection based on the data collected in the available patient
###   cohorts
### Aliases: RunPRMD

### ** Examples

data("patlist_sim")
# check the whole dataset by function patlist.display
patlist.display(patlist_sim, n.dose = 6, n.cycle = 6)

# When we pick the records before 6th cohort enrolled in the study
L <- length(patlist_sim$PatID)
patlist <- lapply(patlist_sim, function(a){a <- a[-(44:L)]})
patlist.display(patlist, n.dose = 6, n.cycle = 6)

#The table shows the current patient in the trial. Now record the active
#patient ID and records as follows

patID_act <- c("cohort1subject1", "cohort1subject2", "cohort1subject3",
               "cohort2subject1", "cohort2subject2", "cohort2subject3",
               "cohort3subject2", "cohort3subject3",
               "cohort4subject1", "cohort4subject2", "cohort4subject3",
               "cohort5subject1", "cohort5subject2", "cohort5subject3")
cycle_act <- c(5, 5, 5, 4, 4, 4, 3, 3, 2, 2, 2, 1, 1 ,1)
dose_act <- c(3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 4, 4, 4)
dlt_act <- c(0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0)

## No test: 
test <- RunPRMD(patlist = patlist, patID_act = patID_act,
                cycle_act = cycle_act, dose_act = dose_act,
                dlt_act = dlt_act, trialSize = 36, chSize = 3,
                effcy.flag = TRUE, ICD.flag = TRUE, DLT.drop.flag = TRUE,
                IED.flag = TRUE, ICD_thrd = 0.3)

summary(test)
plot(test)
plot(test, select_cycle = 1:2)
## End(No test)




