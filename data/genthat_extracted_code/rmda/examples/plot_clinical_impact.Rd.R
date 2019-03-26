library(rmda)


### Name: plot_clinical_impact
### Title: Plot the clinical impact curve from a DecisionCurve object.
### Aliases: plot_clinical_impact

### ** Examples

#'data(dcaData)
set.seed(123)
baseline.model <- decision_curve(Cancer~Age + Female + Smokes,
                                data = dcaData,
                                thresholds = seq(0, .4, by = .001),
                                bootstraps = 25) #should use more bootstrap replicates in practice!

#plot the clinical impact
plot_clinical_impact(baseline.model, xlim = c(0, .4),
                    col = c("black", "blue"))




