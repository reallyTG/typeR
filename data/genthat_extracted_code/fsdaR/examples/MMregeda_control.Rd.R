library(fsdaR)


### Name: MMregeda_control
### Title: Creates an 'MMregeda_control' object
### Aliases: MMregeda_control
### Keywords: robust regression

### ** Examples


(out <- fsreg(Y~., data=hbk, method="MM", monitoring=TRUE, 
    control=MMregeda_control(eff=seq(0.75, 0.99, 0.01))))




