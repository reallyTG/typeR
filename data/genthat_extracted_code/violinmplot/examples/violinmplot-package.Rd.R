library(violinmplot)


### Name: violinmplot-package
### Title: Combined violin, mean and standard deviation plots.
### Aliases: violinmplot-package
### Keywords: package plot

### ** Examples

library(lattice)
library(violinmplot)

## Sample data frame
x <- c(1,1,1,2,2,3, 1,2,2,3,3,3)
g <- c(1,1,1,1,1,1, 2,2,2,2,2,2)
f <- data.frame("Daten"=x,"Gruppe"=g)

## Display a horizontal violinmplot 
violinmplot( Gruppe ~ Daten, data=f )

## Same plot displayed vertically
violinmplot( Daten ~ Gruppe, data=f, horizontal=FALSE)

## Display the plot again using functions from the package lattice
bwplot( Daten ~ Gruppe, data=f, horizontal=FALSE, panel=panel.violinm)

## Mean and standard deviation can be displayed without violins
bwplot( Daten ~ Gruppe, data=f, horizontal=FALSE, panel=panel.meansdplot)




