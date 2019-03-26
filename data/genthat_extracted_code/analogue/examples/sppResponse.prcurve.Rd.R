library(analogue)


### Name: sppResponse
### Title: Species responses along gradients.
### Aliases: sppResponse sppResponse.prcurve
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

## Extract the fitted species response curves
resp <- sppResponse(aber.pc)

## Look at only the most abundant/frequently occurring taxa
take <- chooseTaxa(abernethy2, max.abun = 25, n.occ = 10, value = FALSE)
layout(matrix(1:12, ncol = 3))  	# split device into panels 
plot(resp, which = take)
layout(1)				# reset device



