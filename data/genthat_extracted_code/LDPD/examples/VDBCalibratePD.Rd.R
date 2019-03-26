library(LDPD)


### Name: VDBCalibratePD
### Title: Probability of Default Calibration using M. Van Der Burgt
###   Algorithm
### Aliases: VDBCalibratePD
### Keywords: credit risk probability of default PD calibration

### ** Examples

portf.rating <- c(20,50,60,70,10,5)
portf.scores <- seq_len(1000)
VDBCalibratePD(portf.scores, 0.1, 0.15, 0.5, rating.type = 'SCORE')
VDBCalibratePD(portf.rating, 0.1, 0.15, 0.5, rating.type = 'RATING')



