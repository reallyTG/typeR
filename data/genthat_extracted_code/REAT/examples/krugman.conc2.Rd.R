library(REAT)


### Name: krugman.conc2
### Title: Krugman coefficient of spatial industry concentration for more
###   than two industries
### Aliases: krugman.conc2

### ** Examples

# Example from Farhauer/Kroell (2013):
Chemie <- c(20000,11000,31000,8000,20000)
Sozialwesen <- c(40000,10000,25000,9000,16000)
Elektronik <- c(10000,11000,14000,14000,13000)
Holz <- c(7000,7500,11000,1500,36000)
Bergbau <- c(4320, 7811, 3900, 2300, 47560)
# five industries
industries <- data.frame(Chemie, Sozialwesen, Elektronik, Holz)
# data frame with all comparison industries
krugman.conc2(Bergbau, industries)
# returns the Krugman coefficient for the concentration
# of the mining industry (Bergbau) compared to 
# chemistry (Chemie), social services (Sozialwesen), 
# electronics (Elektronik) and wood industry (Holz)
# 0.8619



