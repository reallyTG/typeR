library(analogue)


### Name: plot.prcurve
### Title: Plot a fitted principal curve in PCA space
### Aliases: plot.prcurve lines.prcurve
### Keywords: hplot

### ** Examples

## Load the Abernethy Forest data
data(abernethy)

## Remove the Depth and Age variables
abernethy2 <- abernethy[, -(37:38)]

## Fit the principal curve using varying complexity of smoothers
## for each species
aber.pc <- prcurve(abernethy2, method = "ca", trace = TRUE,
                   vary = TRUE, penalty = 1.4)

## Plot the curve
plot(aber.pc)

## The lines() method can be used to add the principal curve to an
## existing plot
ord <- rda(abernethy2)
plot(ord, scaling = 1)
lines(aber.pc, scaling = 1)



