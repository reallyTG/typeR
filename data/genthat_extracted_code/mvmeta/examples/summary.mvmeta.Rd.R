library(mvmeta)


### Name: summary.mvmeta
### Title: Summarizing mvmeta Models
### Aliases: summary.mvmeta print.mvmeta print.summary.mvmeta
### Keywords: models regression multivariate methods

### ** Examples

# RUN THE MODEL 
model <- mvmeta(cbind(PD,AL)~pubyear,S=berkey98[5:7],data=berkey98)

# SIMPLE PRINT
model
# DEFINE DIGITS
print(model,digit=2)
# SUMMARY WITH 80TH CONFIDENCE INTERVALS
summary(model,ci.level=0.80)



