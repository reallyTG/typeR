library(KarsTS)


### Name: genTSExample
### Title: A function to generate an example time series
### Aliases: genTSExample
### Keywords: ~kwd1 ~kwd2

### ** Examples


# Generate white noise and assign to the KTSEnv environment
genTSExample(stationary = TRUE, name = "WN")
graphics::plot(KTSEnv$WN, type = "l")

# Generate random walk and not assign to the KTSEnv environment
RW <- genTSExample(stationary = FALSE, InKTSEnv = FALSE)
graphics::plot(RW, type = "l")



