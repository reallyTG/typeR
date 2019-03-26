library(oce)


### Name: setFlags,adp-method
### Title: Set data-quality flags within a adp object
### Aliases: setFlags,adp-method

### ** Examples

library(oce)
data(adp)

## Example 1: flag first 10 samples in a mid-depth bin of beam 1
i1 <- data.frame(1:20, 40, 1)
adpQC <- initializeFlags(adp, "v", 2)
adpQC <- setFlags(adpQC, "v", i1, 3)
adpClean1 <- handleFlags(adpQC, flags=list(3), actions=list("NA"))
par(mfrow=c(2, 1))
## Top: original, bottom: altered
plot(adp, which="u1")
plot(adpClean1, which="u1")

## Example 2: percent-good and error-beam scheme
v <- adp[["v"]]
i2 <- array(FALSE, dim=dim(v))
g <- adp[["g", "numeric"]]
# Thresholds on percent "goodness" and error "velocity"
G <- 25
V4 <- 0.45
for (k in 1:3)
    i2[,,k] <- ((g[,,k]+g[,,4]) < G) | (v[,,4] > V4)
adpQC2 <- initializeFlags(adp, "v", 2)
adpQC2 <- setFlags(adpQC2, "v", i2, 3)
adpClean2 <- handleFlags(adpQC2, flags=list(3), actions=list("NA"))
## Top: original, bottom: altered
plot(adp, which="u1")
plot(adpClean2, which="u1") # differs at 8h and 20h




