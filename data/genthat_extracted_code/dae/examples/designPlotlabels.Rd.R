library(dae)


### Name: designPlotlabels
### Title: Plots labels on a two-way grid using 'ggplot2'
### Aliases: designPlotlabels
### Keywords: aplot hplot design

### ** Examples

Treatments <- factor(rep(1:6, times = 5))
RCBD.lay <- designRandomize(allocated = Treatments,
                            recipient = list(Blocks = 5, Units = 6),
                            nested.recipients = list(Units = "Blocks"),
                            seed = 74111)
designPlotlabels(RCBD.lay, labels = "Treatments", 
                 grid.x = "Units", grid.y = "Blocks",
                 colour.column = "Treatments", size = 5)



