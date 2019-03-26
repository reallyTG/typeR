library(rmda)


### Name: summary.decision_curve
### Title: Displays a useful description of a decision_curve object
### Aliases: summary.decision_curve

### ** Examples

#helper function

#load simulated data
data(dcaData)

full.model <- decision_curve(Cancer~Age + Female + Smokes + Marker1 + Marker2,
data = dcaData,
thresholds = seq(0, .4, by = .05),
bootstraps = 25)

summary(full.model) #outputs standardized net benefit by default

summary(full.model, nround = 2, measure = "TPR")




