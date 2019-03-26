library(EnviroPRA)


### Name: DWIRboot
### Title: Chemical intake by Drinking Water by bootstrap
### Aliases: DWIRboot
### Keywords: methods

### ** Examples

# Carcinogenic effects

c <- rnorm( n= 10, mean = 250, sd = 15 )

b <- rnorm( n= 100, mean = 20, sd = 5 )

DWIRboot (n = 1000, CW=c, IR=1.5, EF = 300, ED = 24, BW = b)



