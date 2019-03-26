library(BAMMtools)


### Name: ratesHistogram
### Title: Histogram of 'BAMM' rate frequencies
### Aliases: ratesHistogram

### ** Examples

data(primates, events.primates)
ed <- getEventData(primates, events.primates, burnin=0.25, nsamples=500,
                   type = 'trait')

# create phylorate plot with the jenks breaks method to generate output
phylorates <- plot(ed, breaksmethod='jenks', show = FALSE)

ratesHistogram(phylorates, plotBrks = TRUE, xlab = 'trait rates')



