library(Evomorph)


### Name: PlotVariations
### Title: Plot shapes
### Aliases: PlotVariations

### ** Examples
 
data("aegla_consensus")
data("simulated_shapes")

#Sample one individual from simulated_shapes dataset

simu<-simulated_shapes[100]

#Create a shape variation graphic

graph<-PlotVariations(simu,aegla_consensus)

#Red dots represent the landmark coordinates of the reference shape and black
# dots represent the target shape. The length of the segments represent 
# distances between pairs of homologous landmarks
  
graph[[1]]



