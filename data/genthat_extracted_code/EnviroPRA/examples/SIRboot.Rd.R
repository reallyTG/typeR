library(EnviroPRA)


### Name: SIRboot
### Title: Chemical intake by accidental soil ingestion by bootstrap
### Aliases: SIRboot
### Keywords: methods

### ** Examples


# Carcinogenic effects

c <- rnorm( n= 10, mean = 22, sd = 2 )

b <- rnorm( n= 100, mean = 20, sd = 5 )

SIRboot (n = 1000, CS = c, BW = b, IR = 200, ED = 10, EF = 250)



