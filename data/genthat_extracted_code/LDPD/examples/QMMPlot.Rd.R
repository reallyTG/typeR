library(LDPD)


### Name: QMMPlot
### Title: Plot Results of Probability of Default Calibration
### Aliases: QMMPlot
### Keywords: credit risk probability of default PD calibration

### ** Examples

pd <- c(0.2, 0.1, 0.005, 0.001, 0.001)
porfolio <- c(100, 200, 200, 200, 100)
qmm <- QMMRecalibrate(0.05, pd, porfolio, rating.type = 'RATING')
QMMPlot(qmm)



