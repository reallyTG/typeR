library(comf)


### Name: calcTNZPDF
### Title: Calculating values related to TNZ approach
### Aliases: calcTNZPDF calcTNZ TNZ PDF
### Keywords: manip

### ** Examples

## Calculate and draw pdf of TNZ for a young non-obese male 
longTcYoungMale <- calcTNZPDF(ht = 178, wt = 70, age = 30, gender = 2, clo = 0.5, 
vel = 0.2, tskObs = 36.2, taObs = 26, met = 1, 
rh = 50, fBasMet = "rosa", fSA = "duBois", percCov = 0.6, 
TcMin = 36, TcMax = 38, plotZone = FALSE, gridTaMin = 20, gridTaMax = 30, 
gridTskMin = 20, gridTskMax = 42, gridTa = 1000, gridTsk = 1000, sa = 2.0335, IbMax = 0.124, 
IbMin = 0.03, alphaIn = 0, metMin = 55.3, metMax = 57.3, metDiff = 0.1, forPDF = TRUE)

plot(density(longTcYoungMale$X2), main="", xlim=c(14,36), ylim=c(0,.50), 
xlab="Operative temperature [degree C]") 	



