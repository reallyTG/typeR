library(effsize)


### Name: VD.A
### Title: Vargha and Delaney A measure
### Aliases: VD.A VD.A.default VD.A.formula
### Keywords: effect size Vargha and Delaney

### ** Examples

treatment = rnorm(100,mean=10)
control = rnorm(100,mean=12)
d = (c(treatment,control))
f = rep(c("Treatment","Control"),each=100)
## compute Vargha and Delaney A
## treatment and control
VD.A(treatment,control)
## data and factor
VD.A(d,f)
## formula interface
VD.A(d ~ f)



