library(GGEBiplots)


### Name: GGEPlot
### Title: GGE biplots with 'ggplot2'
### Aliases: GGEPlot
### Keywords: Biplot GGE

### ** Examples

library(GGEBiplotGUI)
data(Ontario)
GGE1<-GGEModel(Ontario)
GGEPlot(GGE1)

#using 'gge' instead

library(gge)
GGE2<-gge(as.matrix(Ontario))
GGEPlot(GGE2)
   



