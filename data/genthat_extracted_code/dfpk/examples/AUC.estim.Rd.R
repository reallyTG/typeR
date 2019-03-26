library(dfpk)


### Name: AUC.estim
### Title: Estimation of the area under the curve, AUC.
### Aliases: AUC.estim

### ** Examples

#### A Compartmental method for calculation of AUC ###

dose = c(12.59972, 34.65492, 44.69007, 60.80685, 83.68946, 100.37111)
conc = c(20, 30, 40, 50, 60, 70)
t = seq(0, 24, length.out=48)
auc_estimation <- AUC.estim(t, conc, dose, method = 1)
auc_estimation 



