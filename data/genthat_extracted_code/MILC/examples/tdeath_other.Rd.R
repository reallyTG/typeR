library(MILC)


### Name: tdeath_other
### Title: Predict the age at death from a cause other than lung cancer
### Aliases: tdeath_other
### Keywords: Functions

### ** Examples

# Predict the age at death from a cause other than lung cancer for a man 52 years old, 
# who have never smoked.
data(current.other, former.other, never.other)
d.other <- tdeath_other(runif(1), runif(1), "never", c(52, "male", NA))
d.other[[1]]
d.other[[2]]
d.other[[3]]
d.other[[4]]
d.other[[5]]
d.other[[6]]



