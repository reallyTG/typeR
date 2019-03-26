library(MILC)


### Name: tdeath_lung
### Title: Predict the age at death from lung cancer
### Aliases: tdeath_lung
### Keywords: Functions

### ** Examples

# Predict the age at death from lung cancer for a woman, diagnosed with 
# "localized" tumor at the age of 89 years
data(ci.lung)
d.lung <- tdeath_lung(runif(1), runif(1), c("localized", 89, "female"))
d.lung[[1]]
d.lung[[2]]
d.lung[[3]]
d.lung[[4]]
d.lung[[5]]
d.lung[[6]]



