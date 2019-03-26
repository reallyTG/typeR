library(StatMeasures)


### Name: ks
### Title: Kolmogorov-Smirnov statistic for predicted binary response
### Aliases: ks

### ** Examples

# A 'data.frame' with y and yhat
df <- data.frame(y = c(1, 0, 1, 1, 0),
                 yhat = c(0.86, 0.23, 0.65, 0.92, 0.37))

# KS table and value
ltKs <- ks(y = df[, 'y'], yhat = df[, 'yhat'])
ksTable <- ltKs$ksTable
KS <- ltKs$ks



