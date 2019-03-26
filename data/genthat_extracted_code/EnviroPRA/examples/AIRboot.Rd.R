library(EnviroPRA)


### Name: AIRboot
### Title: Inhalation of airborne chemicals by bootstrap
### Aliases: AIRboot
### Keywords: methods

### ** Examples

# Carcinogenic effects

c <- rnorm( n= 10, mean = 0.2, sd = 0.05 )

b <- rnorm( n= 100, mean = 20, sd = 5 )

AIRboot (n = 1000, CA=c, IR=25, ET = 24, EF = 300, ED = 24, BW = b)



