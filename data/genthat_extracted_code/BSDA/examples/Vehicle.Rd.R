library(BSDA)


### Name: Vehicle
### Title: Fatality ratings for foreign and domestic vehicles
### Aliases: Vehicle
### Keywords: datasets

### ** Examples


T1 <- xtabs(~make + rating, data = Vehicle)
T1
chisq.test(T1)




