library(survival)


### Name: cox.zph
### Title: Test the Proportional Hazards Assumption of a Cox Regression
### Aliases: cox.zph [.cox.zph print.cox.zph
### Keywords: survival

### ** Examples

fit <- coxph(Surv(futime, fustat) ~ age + ecog.ps,  
             data=ovarian) 
temp <- cox.zph(fit) 
print(temp)                  # display the results 
plot(temp)                   # plot curves 



