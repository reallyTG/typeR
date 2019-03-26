library(coin)


### Name: CWD
### Title: Coarse Woody Debris
### Aliases: CWD
### Keywords: datasets

### ** Examples

## Zeileis and Hothorn (2013, pp. 942-944)
## Approximative (Monte Carlo) maximally selected statistics
CWD[1:6] <- 100 * CWD[1:6] # scaling (to avoid harmless warning)
mt <- maxstat_test(sample2 + sample3 + sample4 +
                   sample6 + sample7 + sample8 ~ trend, data = CWD,
                   distribution = approximate(B = 100000))

## Absolute maximum of standardized statistics (t = 3.08)
statistic(mt)

## 5 % critical value (t_0.05 = 2.86)
(c <- qperm(mt, 0.95))

## Only 'sample8' exceeds the 5 % critical value
sts <- statistic(mt, type = "standardized")
idx <- which(sts > c, arr.ind = TRUE)
sts[unique(idx[, 1]), unique(idx[, 2]), drop = FALSE]



