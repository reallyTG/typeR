library(analogue)


### Name: scores.prcurve
### Title: 'scores' method for principal curve objects of class
###   '"prcurve"'.
### Aliases: scores.prcurve
### Keywords: methods

### ** Examples

## Load the Abernethy Forest data set
data(abernethy)

## Remove the Depth and Age variables
abernethy2 <- abernethy[, -(37:38)]

## Fit the principal curve using varying complexity of smoothers
## for each species
aber.pc <- prcurve(abernethy2, method = "ca", trace = TRUE,
                   vary = TRUE, penalty = 1.4)

## Extract position on the curve
pos <- scores(aber.pc, display = "curve")
head(pos)

## Extract the coordinates of the curve
coord <- scores(aber.pc, display = "dimensions")
dim(coord)
all.equal(dim(coord), dim(abernethy2))



