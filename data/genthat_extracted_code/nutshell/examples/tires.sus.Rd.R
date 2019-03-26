library(nutshell)


### Name: tires.sus
### Title: Stepped Up Speed Tire Failure Test Data
### Aliases: tires.sus
### Keywords: datasets

### ** Examples

data(tires.sus)
library(lattice)
dotplot(as.factor(Speed_At_Failure_km_h) ~ Time_To_Failure | Tire_Type,
        data=tires.sus)



