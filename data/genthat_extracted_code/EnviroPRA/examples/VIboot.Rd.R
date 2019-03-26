library(EnviroPRA)


### Name: VIboot
### Title: Chemical intake by ingestion of vegetables by bootstrap
### Aliases: VIboot
### Keywords: methods

### ** Examples


# Assess the chemical intake by an adult that eats lettuce with a concentration of 2 mg/ Kg of a 
# chemical with non- carcinogenic effects in a maximum reasonable exposure scenario
# Figure out 10 data of Chemical concentration following a normal distribution (mean = 2, sd= 2)
# and 100 Body weight data that follow a normal distribution (mean = 70, sd = 15)

c <- rnorm( n= 10, mean = 2, sd = 2 )

b <- rnorm( n= 100, mean = 70, sd = 5 )

VIboot (n = 1000, CF = c, BW = b, AT = 365*24)



