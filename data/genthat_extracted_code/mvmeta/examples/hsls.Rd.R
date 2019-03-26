library(mvmeta)


### Name: hsls
### Title: High School Longitudinal Study
### Aliases: hsls
### Keywords: datasets

### ** Examples

### REPRODUCE THE RESULTS IN CHEN ET AL. (2012)

# INSPECT THE DATA
hsls

# FIXED-EFFECTS MODEL
S <- as.matrix(hsls[5:10])
model <- mvmeta(cbind(b1,b2,b3),S,data=hsls,method="fixed")
summary(model)

# MM MODEL
model <- mvmeta(cbind(b1,b2,b3),S,data=hsls,method="mm")
summary(model)
model$Psi



