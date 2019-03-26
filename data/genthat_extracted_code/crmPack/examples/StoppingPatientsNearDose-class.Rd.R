library(crmPack)


### Name: StoppingPatientsNearDose-class
### Title: Stop based on number of patients near to next best dose
### Aliases: StoppingPatientsNearDose-class .StoppingPatientsNearDose
### Keywords: classes

### ** Examples


# As example, here is the rule for: 
#   stopping the study if at least 9 patients were dosed at a dose within (1 +/- 0.2) 
#   of the next best dose

myStopping <- StoppingPatientsNearDose(nPatients = 9,
                                       percentage = 0.2)




