library(mvmeta)


### Name: berkey98
### Title: Five Published Trials on Periodontal Disease
### Aliases: berkey98
### Keywords: datasets

### ** Examples

### REPRODUCE THE RESULTS IN BERKEY ET AL. (1998)

# INSPECT THE DATA
berkey98

# FIXED-EFFECTS
year <- berkey98$pubyear - 1983
model <- mvmeta(cbind(PD,AL)~year,S=berkey98[5:7],data=berkey98,method="fixed")
print(summary(model),digits=3)

# GLS MODEL (VARIANCE COMPONENTS) 
model <- mvmeta(cbind(PD,AL)~year,S=berkey98[5:7],data=berkey98,method="vc",
  control=list(vc.adj=FALSE))
print(summary(model),digits=3)
round(model$Psi,3)

# ML MODEL
model <- mvmeta(cbind(PD,AL)~year,S=berkey98[5:7],data=berkey98,method="ml")
print(summary(model),digits=3)
round(model$Psi,3)



