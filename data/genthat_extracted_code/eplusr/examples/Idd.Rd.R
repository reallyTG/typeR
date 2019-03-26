library(eplusr)


### Name: Idd
### Title: Parse, Query and Modify EnergyPlus Input Data Dictionary (IDD)
### Aliases: Idd

### ** Examples

# get the Idd object of EnergyPlus v8.8
idd <- use_idd(8.8, download = "auto")

# version
idd$version()

# build
idd$build()

# all group names
str(idd$group_name())

# all class names
str(idd$class_name())

# all required class names
str(idd$required_class_name())

# all unique class names
str(idd$unique_class_name())

# IddObject of SimulationControl class
idd$SimulationControl
# OR
idd[["SimulationControl"]]




