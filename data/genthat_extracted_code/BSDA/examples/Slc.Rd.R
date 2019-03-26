library(BSDA)


### Name: Slc
### Title: Sodium-lithium countertransport activity on 190 individuals from
###   six large English kindred
### Aliases: Slc
### Keywords: datasets

### ** Examples


EDA(Slc$slc)
hist(Slc$slc, freq = FALSE, xlab = "sodium lithium countertransport",
     main = "", col = "lightblue")
lines(density(Slc$slc), col = "purple")




