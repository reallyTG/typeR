library(crmPack)


### Name: StoppingCohortsNearDose-class
### Title: Stop based on number of cohorts near to next best dose
### Aliases: StoppingCohortsNearDose-class .StoppingCohortsNearDose
### Keywords: classes

### ** Examples


# As example, here is the rule for: 
#   stopping the study if at least 3 cohorts were dosed at a dose within (1 +/- 0.2) 
#   of the next best dose

myStopping <- StoppingCohortsNearDose(nCohorts = 3,
                                      percentage = 0.2)




