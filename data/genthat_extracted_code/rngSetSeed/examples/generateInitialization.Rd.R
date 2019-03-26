library(rngSetSeed)


### Name: generateInitialization
### Title: Generates a random integer vector of a specified length using
###   AES
### Aliases: generateInitialization

### ** Examples

  s1 <- generateInitialization(1, 3)
  s2 <- generateInitialization(c(1, 0), 3)
  s3 <- generateInitialization(c(1, 0, 0), 3)
  stopifnot(s1 == c(2054882070, -83320660, -37036705))
  stopifnot(s2 == c(-1435341980, 1760892082, 970206446))
  stopifnot(s3 == c(1941187208, 915534877, -365000103))



