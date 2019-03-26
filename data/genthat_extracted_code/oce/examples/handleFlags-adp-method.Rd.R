library(oce)


### Name: handleFlags,adp-method
### Title: Handle Flags in adp Objects
### Aliases: handleFlags,adp-method

### ** Examples

# Flag low "goodness" or high "error beam" values.
library(oce)
data(adp)
# Same as Example 2 of ?'setFlags,adp-method'
v <- adp[["v"]]
i2 <- array(FALSE, dim=dim(v))
g <- adp[["g", "numeric"]]
# Thresholds on percent "goodness" and error "velocity"
G <- 25
V4 <- 0.45
for (k in 1:3)
    i2[,,k] <- ((g[,,k]+g[,,4]) < G) | (v[,,4] > V4)
adpQC <- initializeFlags(adp, "v", 2)
adpQC <- setFlags(adpQC, "v", i2, 3)
adpClean <- handleFlags(adpQC, flags=list(3), actions=list("NA"))
# Demonstrate (subtle) change graphically.
par(mfcol=c(2, 1))
plot(adp, which="u1")
plot(adpClean, which="u1")




