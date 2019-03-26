library(rstpm2)


### Name: cox.tvc
### Title: Test for a time-varying effect in the 'coxph' model
### Aliases: cox.tvc
### Keywords: time-varying,Cox

### ** Examples

## As per the example for cox.zph:
fit <- coxph(Surv(futime, fustat) ~ age + ecog.ps,  
             data=ovarian) 
temp <- rstpm2:::cox.tvc(fit, "age") 
print(temp)                  # display the results 
plot(temp)                   # plot curves 



