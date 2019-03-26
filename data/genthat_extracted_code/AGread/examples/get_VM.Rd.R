library(AGread)


### Name: get_VM
### Title: Calculate vector magnitude
### Aliases: get_VM

### ** Examples

data(imu_to_collapse)

vm_columns <-
    grepl("accelerometer",
        names(imu_to_collapse),
        ignore.case = TRUE)

get_VM(data.frame(imu_to_collapse)[, vm_columns])




