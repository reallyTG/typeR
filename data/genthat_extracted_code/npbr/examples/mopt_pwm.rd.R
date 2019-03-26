library(npbr)


### Name: mopt_pwm
### Title: Threshold selection for the PWM frontier estimator
### Aliases: mopt_pwm
### Keywords: nonparametric

### ** Examples

data("post")
x.post<- seq(post$xinput[100],max(post$xinput), 
 length.out=100) 
## Not run: 
##D # When rho[x] is known and equal to 2:
##D best_cm.1<- mopt_pwm(post$xinput, post$yprod, 
##D  x.post, a=2, rho=2)
## End(Not run)



