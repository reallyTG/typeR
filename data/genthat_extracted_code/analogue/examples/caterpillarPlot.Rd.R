library(analogue)


### Name: caterpillarPlot
### Title: Caterpillar plot of species' WA optima and tolerance range.
### Aliases: caterpillarPlot caterpillarPlot.default
###   caterpillarPlot.data.frame caterpillarPlot.wa caterpillar
### Keywords: hplot

### ** Examples

data(ImbrieKipp)
data(SumSST)

## default plot
caterpillar(ImbrieKipp, SumSST)

## customisation
opttol <-
    caterpillar(ImbrieKipp, SumSST, col = "red2",
                bg = "yellow", lcol = "blue",
                xlab = expression(Summer ~ Sea ~ Surface ~
                                 Temperature~(degree*C)))

## invisibly returns the optima and tolerances
head(opttol)



