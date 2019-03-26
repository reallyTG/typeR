library(fsdaR)


### Name: FSReda_control
### Title: Creates an 'FSReda_control' object
### Aliases: FSReda_control
### Keywords: robust regression

### ** Examples


(out <- fsreg(Y~., data=hbk, method="FS", monitoring=TRUE, 
    control=FSReda_control(tstat="scal")))



