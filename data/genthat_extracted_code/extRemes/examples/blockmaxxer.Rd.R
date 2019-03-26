library(extRemes)


### Name: blockmaxxer
### Title: Find Block Maxima
### Aliases: blockmaxxer blockmaxxer.data.frame blockmaxxer.fevd
###   blockmaxxer.matrix blockmaxxer.vector
### Keywords: manip

### ** Examples

data(Fort)

bmFort <- blockmaxxer(Fort, blocks = Fort$year, which="Prec")

plot(Fort$year, Fort$Prec, xlab = "Year", ylab = "Precipitation (inches)",
    cex = 1.25, cex.lab = 1.25,
    col = "darkblue", bg = "lightblue", pch = 21)

points(bmFort$year, bmFort$Prec, col="darkred", cex=1.5)




