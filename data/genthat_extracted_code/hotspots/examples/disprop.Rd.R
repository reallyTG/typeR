library(hotspots)


### Name: disprop
### Title: Disproportionality
### Aliases: disprop

### ** Examples

rln30 <- sort(c(rlnorm(15),rlnorm(15)*-1,NA), na.last = TRUE)
rln30
disprop(hotspots(rln30, tail = "both"))

#higher levels of disproportionality
rln30sd2 <- sort(c(rlnorm(15,sd = 3),rlnorm(15,sd = 3)*-1,NA), na.last = TRUE)
rln30sd2
disprop(hotspots(rln30sd2, tail = "both"))



