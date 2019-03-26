library(IndexNumR)


### Name: maximumSimilarityLinks
### Title: Finds periods to link using minimum dissimilarity.
### Aliases: maximumSimilarityLinks

### ** Examples

# find the linking periods in the CES_sigma_2 dataset that maximise
# the similarity between periods, using the absolute dissimilarity measure.
disMat <- mixScaleDissimilarity(CES_sigma_2, pvar = "prices", qvar = "quantities",
pervar = "time", prodID = "prodID", measure = "absolute",
combine = "geomean")
maximumSimilarityLinks(disMat)



