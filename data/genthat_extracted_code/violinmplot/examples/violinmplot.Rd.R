library(violinmplot)


### Name: violinmplot
### Title: Combined violin plot with arithmetic mean and standard
###   deviation.
### Aliases: violinmplot
### Keywords: plot

### ** Examples

library(violinmplot)

## Sample data frame
x <- c(1,1,1,2,2,3, 1,2,2,3,3,3)
g <- c(1,1,1,1,1,1, 2,2,2,2,2,2)
f <- data.frame("Daten"=x,"Gruppe"=g)

## Display a horizontal violinmplot 
violinmplot( Gruppe ~ Daten, data=f )

## Same plot displayed vertically
violinmplot( Daten ~ Gruppe, data=f, horizontal=FALSE)




