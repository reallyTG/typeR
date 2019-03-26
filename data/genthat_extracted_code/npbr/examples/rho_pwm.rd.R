library(npbr)


### Name: rho_pwm
### Title: Probability-weighted moment frontier estimator
### Aliases: rho_pwm
### Keywords: nonparametric

### ** Examples

data("post")
x.post<- seq(post$xinput[100],max(post$xinput), 
 length.out=100) 
## Not run: 
##D # When rho[x] is unknown and dependent of x, 
##D # its estimate hat(rho[x]) is obtained via:
##D rho_pwm <- rho_pwm(post$xinput, post$yprod, x.post,  a=20)
## End(Not run)



