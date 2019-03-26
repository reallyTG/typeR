library(HyperbolicDist)


### Name: Hyperbolic
### Title: Hyperbolic Distribution
### Aliases: dhyperb phyperb qhyperb rhyperb ddhyperb hyperbBreaks
### Keywords: distribution

### ** Examples

Theta <- c(2,1,1,0)
hyperbRange <- hyperbCalcRange(Theta, tol = 10^(-3))
par(mfrow = c(1,2))
curve(dhyperb(x, Theta), from = hyperbRange[1], to = hyperbRange[2],
      n = 1000)
title("Density of the\n Hyperbolic Distribution")
curve(phyperb(x, Theta), from = hyperbRange[1], to = hyperbRange[2],
      n = 1000)
title("Distribution Function of the\n Hyperbolic Distribution")
dataVector <- rhyperb(500, Theta)
curve(dhyperb(x, Theta), range(dataVector)[1], range(dataVector)[2],
      n = 500)
hist(dataVector, freq = FALSE, add =TRUE)
title("Density and Histogram\n of the Hyperbolic Distribution")
logHist(dataVector, main =
        "Log-Density and Log-Histogram\n of the Hyperbolic Distribution")
curve(log(dhyperb(x, Theta)), add = TRUE,
      range(dataVector)[1], range(dataVector)[2], n = 500)
par(mfrow = c(2,1))
curve(dhyperb(x, Theta), from = hyperbRange[1], to = hyperbRange[2],
      n = 1000)
title("Density of the\n Hyperbolic Distribution")
curve(ddhyperb(x, Theta), from = hyperbRange[1], to = hyperbRange[2],
      n = 1000)
title("Derivative of the Density\n of the Hyperbolic Distribution")
par(mfrow = c(1,1))
hyperbRange <- hyperbCalcRange(Theta, tol = 10^(-6))
curve(dhyperb(x, Theta), from = hyperbRange[1], to = hyperbRange[2],
      n = 1000)
bks <- hyperbBreaks(Theta)
abline(v = bks)



