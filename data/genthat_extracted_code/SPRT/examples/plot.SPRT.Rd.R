library(SPRT)


### Name: plot.SPRT
### Title: Plot SPRT boundaries and acceptance regions
### Aliases: plot.SPRT

### ** Examples

## Run the SPRT() function
test <- SPRT(distribution = "normal", type1 = 0.05, type2 = 0.20,
  h0 = 0, h1 = 1, values = rnorm(10))

## Plot k vs. H0 and H1 boundaries
plot(test)

## Plot the random variable's log-likelihood ratio vs. Wald's A and B constants
plot(test, log = "y")

## Draw a line through through dots
plot(test, log = "y", type = "b")

## Change the size and appearance of the dots
plot(test, log = "y", pch = 20, cex = 1.25)

## Use difference colours for the dots and boundaries
plot(test, log = "y", pch = 20, cex = 1.25, col = c(1,2,3))



