library(BAMMtools)


### Name: assignColorBreaks
### Title: Map macroevolutionary rates to colors
### Aliases: assignColorBreaks
### Keywords: graphics

### ** Examples

data(whales, events.whales)
ed <- getEventData(whales, events.whales, burnin = 0.2, nsamples = 500)

ed <- dtRates(ed, 0.01)
colors <- assignColorBreaks(ed$dtrates$rates, spex="s") #speciation rates
#colors <- assignColorBreaks(ed$dtrates$rates[[1]]) 
#this also works for speciation rates

plot(ed, colorbreaks = colors, spex="s")
colors <- assignColorBreaks(ed$dtrates$rates, spex="netdiv") 
#diversification rates

#colors <- assignColorBreaks(ed$dtrates$rates[[1]] - ed$dtrates$rates[[2]]) 
#this also works for diversification rates

plot(ed, colorbreaks = colors, spex="netdiv")



