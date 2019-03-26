library(survival)


### Name: summary.coxph
### Title: Summary method for Cox models
### Aliases: summary.coxph
### Keywords: survival

### ** Examples

fit <- coxph(Surv(time, status) ~ age + sex, lung) 
summary(fit) 
## Not run: 
##D Call: 
##D coxph(formula = Surv(time, status) ~ age + sex, data = lung) 
##D   
##D   n= 228  
##D   
##D       coef exp(coef) se(coef)     z      p  
##D age  0.017     1.017  0.00922  1.85 0.0650 
##D sex -0.513     0.599  0.16745 -3.06 0.0022 
##D   
##D     exp(coef) exp(-coef) lower .95 upper .95  
##D age     1.017      0.983     0.999     1.036 
##D sex     0.599      1.670     0.431     0.831 
##D   
##D Rsquare= 0.06   (max possible= 0.999 ) 
##D Likelihood ratio test= 14.1  on 2 df,   p=0.000857 
##D Wald test            = 13.5  on 2 df,   p=0.00119 
##D Score (logrank) test = 13.7  on 2 df,   p=0.00105 
## End(Not run)


