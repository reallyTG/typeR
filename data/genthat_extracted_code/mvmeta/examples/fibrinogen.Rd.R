library(mvmeta)


### Name: fibrinogen
### Title: Fibrinogen Studies Collaboration
### Aliases: fibrinogen
### Keywords: datasets

### ** Examples

### REPRODUCE THE RESULTS IN WHITE (2009) AND JACKSON ET AL. (2010)

# INSPECT THE DATA
head(fibrinogen)

# REML MODEL
y <- as.matrix(fibrinogen[2:5])
S <- as.matrix(fibrinogen[6:15])
model <- mvmeta(y,S)

# SUMMARIZE THE RESULTS
print(summary(model),digits=3)
round(model$Psi,3)



