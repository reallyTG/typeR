library(HyperbolicDist)


### Name: SkewLaplace
### Title: Skew-Laplace Distribution
### Aliases: dskewlap pskewlap qskewlap rskewlap
### Keywords: distribution

### ** Examples

Theta <- c(1,2,1)
par(mfrow = c(1,2))
curve(dskewlap(x, Theta), from = -5, to = 8, n = 1000)
title("Density of the\n Skew-Laplace Distribution")
curve(pskewlap(x, Theta), from = -5, to = 8, n = 1000)
title("Distribution Function of the\n Skew-Laplace Distribution")
dataVector <- rskewlap(500, Theta)
curve(dskewlap(x, Theta), range(dataVector)[1], range(dataVector)[2],
      n = 500)
hist(dataVector, freq = FALSE, add =TRUE)
title("Density and Histogram\n of the Skew-Laplace Distribution")
logHist(dataVector, main =
        "Log-Density and Log-Histogram\n of the Skew-Laplace Distribution")
curve(log(dskewlap(x, Theta)), add = TRUE,
      range(dataVector)[1], range(dataVector)[2], n = 500)



