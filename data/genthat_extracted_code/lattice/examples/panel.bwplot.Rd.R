library(lattice)


### Name: F_1_panel.bwplot
### Title: Default Panel Function for bwplot
### Aliases: panel.bwplot
### Keywords: dplot

### ** Examples


bwplot(voice.part ~ height, data = singer,
       xlab = "Height (inches)",
       panel = function(...) {
           panel.grid(v = -1, h = 0)
           panel.bwplot(...)
       },
       par.settings = list(plot.symbol = list(pch = 4)))

bwplot(voice.part ~ height, data = singer,
       xlab = "Height (inches)",
       notch = TRUE, pch = "|")





