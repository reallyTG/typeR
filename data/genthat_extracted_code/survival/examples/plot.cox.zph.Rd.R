library(survival)


### Name: plot.cox.zph
### Title: Graphical Test of Proportional Hazards
### Aliases: plot.cox.zph
### Keywords: survival

### ** Examples

vfit <- coxph(Surv(time,status) ~ trt + factor(celltype) + 
              karno + age, data=veteran, x=TRUE) 
temp <- cox.zph(vfit) 
plot(temp, var=5)      # Look at Karnofsy score, old way of doing plot 
plot(temp[5])     # New way with subscripting 
abline(0, 0, lty=3) 
# Add the linear fit as well  
abline(lm(temp$y[,5] ~ temp$x)$coefficients, lty=4, col=3)  
title(main="VA Lung Study") 



