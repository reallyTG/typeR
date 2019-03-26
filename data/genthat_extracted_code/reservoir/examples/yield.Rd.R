library(reservoir)


### Name: yield
### Title: Storage-Reliability-Yield (SRY) relationships: Yield computation
### Aliases: yield

### ** Examples

# Compute yield for 0.95 reliability
layout(1:3)
yield_ResX <- yield(resX$Q_Mm3, capacity = 500, reliability = 0.95)
# Compute yield for quarterly time series with seasonal demand profile

quart_ts <- aggregate(resX$Q_Mm3, nfrequency = 4)
yld <- yield(quart_ts,
capacity = 500, reliability = 0.9, demand_profile = c(0.8, 1.2, 1.2, 0.8))



