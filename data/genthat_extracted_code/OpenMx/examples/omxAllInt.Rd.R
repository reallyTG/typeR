library(OpenMx)


### Name: omxAllInt
### Title: All Interval Multivariate Normal Integration
### Aliases: omxAllInt

### ** Examples


data(myFADataRaw)

covariance <- cov(myFADataRaw[,1:5])
means <- colMeans(myFADataRaw[,1:5])

# Integrate from -Infinity to 0 and 0 to 1 on first variable
thresholdForColumn1 <- cbind(c(-Inf, 0,   1))
# Note: The first variable will never be calculated from 1 to +Infinity.

# These columns will be integrated from -Inf to -1, -1 to 0, etc.
thresholdsForColumn2 <- cbind(c(-Inf, -1, 0, 1, Inf))
thresholdsForColumns3and4 <- cbind(c(-Inf, 1.96, 2.326, Inf),
                                   c(-Inf, -1.96, 2.326, Inf))

# The integration
omxAllInt(covariance, means,
  thresholdForColumn1, thresholdsForColumn2,
  thresholdsForColumns3and4, thresholdsForColumn2)
# Notice that columns 2 and 5 are assigned identical thresholds.

#-------------------------------------------------------------
# An alternative specification of the same calculation follows
covariance <- cov(myFADataRaw[,1:5])
means <- colMeans(myFADataRaw[,1:5])

# Note NAs to indicate the end of the sequence of thresholds.
thresholds <- cbind(c(-Inf,     0,     1,  NA,  NA),
                    c(-Inf,    -1,     0,   1, Inf),
                    c(-Inf,  1.96,  2.32, Inf,  NA),
                    c(-Inf, -1.96,  2.32, Inf,  NA),
                    c(-Inf,    -1,     0,   1, Inf))
omxAllInt(covariance, means, thresholds)




