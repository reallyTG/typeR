library(SmallCountRounding)


### Name: HD
### Title: Hellinger Distance (Utility)
### Aliases: HD HDutility

### ** Examples

f <- 1:6
g <- c(0, 3, 3, 3, 6, 6)
print(c(
  HD = HD(f, g), 
  HDutility = HDutility(f, g), 
  maxdiff = max(abs(g - f)), 
  meanAbsDiff = mean(abs(g - f)), 
  rootMeanSquare = sqrt(mean((g - f)^2))
))



