library(BAMMtools)


### Name: speciesByRatesMatrix
### Title: Compute species-specific rate through time trajectories
### Aliases: speciesByRatesMatrix
### Keywords: models

### ** Examples

data(whales, events.whales)
ed <- getEventData(whales,events.whales,burnin=0.25, nsamples=500)
ratemat <- speciesByRatesMatrix(ed, nslices = 100)

dolphins <- extract.clade(whales,140)$tip.label
plot.new()
plot.window(xlim=c(0,35),ylim=c(0,0.8))
for (i in 1:nrow(ratemat$rates)) {
    if (whales$tip.label[i] %in% dolphins) {
        lines(ratemat$times, ratemat$rates[i,], lwd=2, col=4)	
    } else {
        lines(ratemat$times, ratemat$rates[i,], lwd=2, col=8)
    }
}
axis(1,seq(-5,35,5))
axis(2,seq(-0.2,0.8,0.2),las=1)
mtext("Time since root",1,line=2.5)
mtext("Speciation rate",2,line=2.5)



