library(rmda)


### Name: plot_decision_curve
### Title: Plot the net benefit curves from a decision_curve object or many
###   decision_curve objects
### Aliases: plot_decision_curve

### ** Examples

data(dcaData)
set.seed(123)
baseline.model <- decision_curve(Cancer~Age + Female + Smokes,
                                data = dcaData,
                                thresholds = seq(0, .4, by = .005),
                                bootstraps = 10)

#plot using the defaults
plot_decision_curve(baseline.model,  curve.names = "baseline model")

set.seed(123)
full.model <- decision_curve(Cancer~Age + Female + Smokes + Marker1 + Marker2,
                            data = dcaData,
                            thresholds = seq(0, .4, by = .005),
                            bootstraps = 10)

# for lwd, the first two positions correspond to the decision curves, then 'all' and 'none'
plot_decision_curve( list(baseline.model, full.model),
                    curve.names = c("Baseline model", "Full model"),
                    col = c("blue", "red"),
                    lty = c(1,2),
                    lwd = c(3,2, 2, 1),
                    legend.position = "bottomright")


plot_decision_curve( list(baseline.model, full.model),
                    curve.names = c("Baseline model", "Full model"),
                    col = c("blue", "red"),
                    confidence.intervals = FALSE,  #remove confidence intervals
                    cost.benefit.axis = FALSE, #remove cost benefit axis
                    legend.position = "none") #remove the legend

#Set specific cost:benefit ratios.

plot_decision_curve( list(baseline.model, full.model),
                    curve.names = c("Baseline model", "Full model"),
                    col = c("blue", "red"),
                    cost.benefits = c("1:1000", "1:4", "1:9", "2:3", "1:3"),
                    legend.position = "bottomright")

#Plot net benefit instead of standardize net benefit.

plot_decision_curve( list(baseline.model, full.model),
                    curve.names = c("Baseline model", "Full model"),
                    col = c("blue", "red"),
                    ylim = c(-0.05, 0.15), #set ylim
                    lty = c(2,1),
                    standardize = FALSE, #plot Net benefit instead of standardized net benefit
                   legend.position = "topright")





