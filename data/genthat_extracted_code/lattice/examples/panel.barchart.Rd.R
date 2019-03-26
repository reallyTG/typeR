library(lattice)


### Name: F_1_panel.barchart
### Title: Default Panel Function for barchart
### Aliases: panel.barchart
### Keywords: dplot

### ** Examples


barchart(yield ~ variety | site, data = barley,
         groups = year, layout = c(1,6), origin = 0,
         ylab = "Barley Yield (bushels/acre)",
         scales = list(x = list(abbreviate = TRUE,
                                minlength = 5)))




