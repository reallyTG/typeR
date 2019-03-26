library(probout)


### Name: simData
### Title: Simulates observations for outlier determination.
### Aliases: simData
### Keywords: datagen

### ** Examples


 radius.default <- LWradius(nrow(faithful),ncol(faithful))
 lead <- leader(faithful, radius = c(0,radius.default))

# (simulated) data for outlier statistic (no simulation for radius = 0)
 sim <- lapply( lead, simData)

# components of simData output
 lapply( sim, names)




