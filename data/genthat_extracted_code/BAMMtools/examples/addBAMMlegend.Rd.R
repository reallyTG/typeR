library(BAMMtools)


### Name: addBAMMlegend
### Title: Add a color legend to a phylo-rate plot
### Aliases: addBAMMlegend

### ** Examples

data(whales, events.whales)
ephy <- getEventData(whales, events.whales, burnin = 0.25, nsamples = 300)

# plot phylorate with extra margin space
x <- plot(ephy, lwd = 2, mar = c(5,4,4,4)) 
# presets
addBAMMlegend(x, location = 'topleft')
addBAMMlegend(x, location = 'bottom')
addBAMMlegend(x, location = 'right')

# fine-tune placement
x <- plot(ephy, lwd = 2, mar = c(5,4,4,4)) 
axis(1); axis(2)
addBAMMlegend(x, location = c(-1, -0.5, 40, 80), nTicks = 4)
addBAMMlegend(x, location = c(5, 20, 60, 61), nTicks = 4, side = 3,
              cex.axis = 0.7)

# addBAMMlegend also automatically detects the use of color.interval
data(primates, events.primates)
ephy <- getEventData(primates, events.primates, burnin=0.25,
                     nsamples = 300, type = 'trait')

x <- plot(ephy, breaksmethod = 'linear',
          color.interval = c(NA, 0.12), lwd = 2)
addBAMMlegend(x, location = c(0, 30, 200, 205), nTicks = 1, side = 3)



