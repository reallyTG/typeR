library(LDPD)


### Name: LDPD-package
### Title: Probability of Default Calibration
### Aliases: LDPD-package LDPD
### Keywords: credit risk probability of default PD calibration low default
###   porfolios PD calibration

### ** Examples

# PD calibration using Multi-period Pluto and Tasche approach
portfolio <- c(10,20,30,40,10)
defaults <- c(1,2,0,0,0)
PTMultiPeriodPD(portfolio, defaults, 0.3, cor.St = 0.3, kT = 5, kNS = 1000, conf.interval = 0.5)

# PD Calibration using M. van der Burgt algorithm, 
# portfolio distribution is given by rating classes.
portf.rating <- c(20,50,60,70,10,5)
VDBCalibratePD(portf.rating, 0.1, 0.15, 0.5, rating.type = 'RATING')
# PD Calibration using M. van der Burgt algorithm, 
# portfolio distribution is given by scores.
portf.scores <- seq_len(1000)
VDBCalibratePD(portf.scores, 0.1, 0.15, 0.5, rating.type = 'SCORE')

# PD calibration using QMM algorithm, 
# portfolio distribution is given by rating classes.
pd <- c(0.2, 0.1, 0.005, 0.001, 0.001)
porfolio <- c(100, 200, 200, 200, 100)
qmm <- QMMRecalibrate(0.05, pd, porfolio, rating.type = 'RATING')
# Plot results of PD calibration.
QMMPlot(qmm)



