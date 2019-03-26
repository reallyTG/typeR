library(EnviroPRA)


### Name: ADboot
### Title: Dermal conctact with chemicals in soil by bootstrap
### Aliases: ADboot

### ** Examples

# Carcinogenic effects

c <- rnorm( n= 10, mean = 0.2, sd = 0.05 )

b <- rnorm( n= 100, mean = 20, sd = 5 )

ADboot (n = 1000, SA=2300, AF=0.25, ABS=0.01,CS = c, BW = b, ED = 10, EF = 250)
  


