library(kyotil)


### Name: cox.zph.2
### Title: Test the Proportional Hazards Assumption of a Cox Regression (a
###   slightly modified version)
### Aliases: cox.zph.2

### ** Examples

library(survival)
fit <- coxph(Surv(futime, fustat) ~ age + ecog.ps,  
             data=ovarian) 
temp <- cox.zph(fit) 
print(temp)        
temp.2 <- cox.zph.2(fit) 
print(temp.2)        




