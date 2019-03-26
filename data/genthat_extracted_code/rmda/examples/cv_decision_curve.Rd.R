library(rmda)


### Name: cv_decision_curve
### Title: Calculate cross-validated decision curves
### Aliases: cv_decision_curve

### ** Examples


full.model_cv <- cv_decision_curve(Cancer~Age + Female + Smokes + Marker1 + Marker2,
                                  data = dcaData,
                                  folds = 5,
                                  thresholds = seq(0, .4, by = .01))

full.model_apparent <- decision_curve(Cancer~Age + Female + Smokes + Marker1 + Marker2,
                                     data = dcaData,
                                     thresholds = seq(0, .4, by = .01),
                                     confidence.intervals = 'none')

plot_decision_curve( list(full.model_apparent, full.model_cv),
                    curve.names = c('Apparent curve', 'Cross-validated curve'),
                    col = c('red', 'blue'),
                    lty = c(2,1),
                    lwd = c(3,2, 2, 1),
                    legend.position = 'bottomright')




