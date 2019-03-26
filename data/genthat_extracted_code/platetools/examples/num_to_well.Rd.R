library(platetools)


### Name: num_to_well
### Title: Converts numbers to well labels
### Aliases: num_to_well

### ** Examples

num_to_well(1:96)
num_to_well(1:96, plate = 384)

nums <- c(1:10, 20:40, 60:96)
num_to_well(nums)



