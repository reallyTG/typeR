library(rpact)


### Name: getSampleSizeSurvival
### Title: Get Sample Size Survival
### Aliases: getSampleSizeSurvival

### ** Examples


# Calculate the number of events and number of patients calculated with 
# the Schoenfeld formula.
getSampleSizeSurvival(getDesignGroupSequential(alpha = 0.025, beta = 0.2, 
    sided = 1), thetaH0 = 1, pi1 = 0.6, pi2 = 0.9, 
    allocationRatioPlanned = 2, typeOfComputation = "Schoenfeld")

# Calculate analysis times, number of aevent, and number of patients 
# under specified event, accrual, followup, and dropout time and event 
# and dropout rates.
getSampleSizeSurvival(getDesignGroupSequential(alpha = .025, sided = 1), 
    pi1 = c(0.25, 0.3, 0.35), pi2 = 0.4, allocationRatioPlanned = 0, 
    typeOfComputation = "Schoenfeld", accountForObservationTimes = TRUE,
    eventTime = 12, accrualTime = 6, followUpTime = 12, 
    maxNumberOfPatients = 0, dropOutRate1 = 0.15, dropOutRate2 = 0.1, 
    dropOutTime = 24)




