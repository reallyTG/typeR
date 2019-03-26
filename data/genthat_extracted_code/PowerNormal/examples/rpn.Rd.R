library(PowerNormal)


### Name: dpn
### Title: The PN distribution
### Aliases: dpn ppn qpn rpn

### ** Examples

# Density

dpn(2,1)
dnorm(2)

# Distribution function

ppn(2,1)
pnorm(2)

# Quantile function

qpn(0.5,1)
qnorm(0.5)


# Random generation

alpha <- 0.5
n <- 10
rpn(n, alpha)



