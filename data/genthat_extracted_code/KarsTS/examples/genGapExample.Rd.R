library(KarsTS)


### Name: genGapExample
### Title: A function to generate a gap set example
### Aliases: genGapExample
### Keywords: ~kwd1 ~kwd2

### ** Examples


# Generate a time series

RW <- genTSExample(stationary = FALSE, InKTSEnv = FALSE)

# Generate 2 gaps of 50 NAs each
G.2.50 <- genGapExample(RW, 50, 2, InKTSEnv = FALSE)

RW1 <- RW
RW1$value[G.2.50$gaps] <- NA
graphics::plot(RW, type = "l", col = "red")
graphics::points(RW1, type = "l", col = "blue")

# The same in the environment KTSEnv
removeIfExists(c("G.2.50","RW1"), envir = environment())
genGapExample(RW, 50, 2, name = "G.2.50")

RW1 <- RW
RW1$value[KTSEnv$G.2.50$gaps] <- NA
graphics::plot(RW, type = "l", col = "red")
graphics::points(RW1, type = "l", col = "blue")




