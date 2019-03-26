library(BAMMtools)


### Name: getJenksBreaks
### Title: Jenks natural breaks classification
### Aliases: getJenksBreaks
### Keywords: graphics

### ** Examples

# load whales dataset
data(whales, events.whales)
ed <- getEventData(whales, events.whales, burnin=0.25, nsamples=500)

# for demonstration purposes, extract the vector of speciation rates
ed <- dtRates(ed, tau=0.01)
vec <- ed$dtrates$rates[[1]]

# Return breaks for the binning of speciation rates into 65 groups
# yielding 64 breaks
getJenksBreaks(vec, 64)



