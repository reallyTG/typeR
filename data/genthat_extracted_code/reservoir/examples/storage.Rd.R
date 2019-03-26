library(reservoir)


### Name: storage
### Title: Storage-Reliability-Yield (SRY) relationships: Storage
###   computation
### Aliases: storage

### ** Examples

# Determine the required storage for 95 % reliability and yield equal to 80 % of the mean inflow.
layout(1:3)
storage(resX$Q_Mm3 * 20, yield = 0.9 * mean(resX$Q_Mm3), reliability = 0.95)



