library(IsoplotR)


### Name: ludwig
### Title: Linear regression of U-Pb data with correlated errors, taking
###   into account decay constant uncertainties.
### Aliases: ludwig ludwig.default ludwig.UPb

### ** Examples

f <- system.file("UPb4.csv",package="IsoplotR")
d <- read.data(f,method="U-Pb",format=4)
fit <- ludwig(d)



