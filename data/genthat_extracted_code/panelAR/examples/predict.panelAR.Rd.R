library(panelAR)


### Name: predict.panelAR
### Title: Predict method for fitted objects of class '"panelAR"'.
### Aliases: predict.panelAR

### ** Examples

data(Rehm)
out <- panelAR(NURR ~ gini, data=Rehm, panelVar='ccode', timeVar='year', autoCorr='ar1', 
panelCorrMethod='pcse', rho.na.rm=TRUE, panel.weight='t-1', bound.rho=TRUE)
summary(out)

# fitted values (with SE and CI)
predict(out, se.fit=TRUE, conf.interval=TRUE)



