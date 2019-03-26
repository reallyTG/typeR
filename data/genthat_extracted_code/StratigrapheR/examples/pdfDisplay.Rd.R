library(StratigrapheR)


### Name: pdfDisplay
### Title: Generates PDF and SVG figures
### Aliases: pdfDisplay

### ** Examples

g1   <- function() plot(1,1)

temp <- tempfile()
dir.create(temp)

pdfDisplay(g1(),8.27,11.69,
           "TestGraph", dir = temp, openfile = TRUE,
           pargs = list(mar = c(6,6,6,6), ps = 24,lwd = 4))




