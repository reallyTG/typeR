library(KarsTS)


### Name: getNewGapsInd
### Title: A function to create random gaps
### Aliases: getNewGapsInd
### Keywords: ~kwd1 ~kwd2

### ** Examples


# Create time series
TS <- genTSExample(InKTSEnv = FALSE)[1:50,]

# Create 3 gaps of 7 NAs each
gInd <- getNewGapsInd(TS, 7, 3)

# Create time series duplicate and apply the gaps
TS1 <- TS
TS1$value[gInd] <- NA

#Compare
cbind(TS, TS1$value)




