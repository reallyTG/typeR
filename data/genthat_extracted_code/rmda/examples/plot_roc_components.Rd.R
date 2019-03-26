library(rmda)


### Name: plot_roc_components
### Title: Plot the components of a ROC curve by the high risk thresholds.
### Aliases: plot_roc_components

### ** Examples

data(dcaData)
set.seed(123)
baseline.model <- decision_curve(Cancer~Age + Female + Smokes,
                                data = dcaData,
                                thresholds = seq(0, .4, by = .001),
                                bootstraps = 25) #should use more bootstrap replicates in practice!

#plot using the defaults
plot_roc_components(baseline.model,  xlim = c(0, 0.4), col = c("black", "red"))





