library(wiqid)


### Name: Bayesian Occupancy Single Season
### Title: Bayesian single-season occupancy modelling
### Aliases: BoccSS BoccSS0

### ** Examples

# The blue ridge salamanders data from MacKenzie et al (2006) p99:
data(salamanders)
y <- rowSums(salamanders)
n <- rowSums(!is.na(salamanders))

tmp <- BoccSS0(y, n)
tmp
occSS0(y, n)  # for comparison
plot(tmp)





