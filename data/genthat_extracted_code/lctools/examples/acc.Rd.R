library(lctools)


### Name: acc
### Title: Spatial Interaction Models: Destination Accessibility
### Aliases: acc
### Keywords: accessibility centrality Competing Destinations Model

### ** Examples

data(GR.Municipalities)
attr<-GR.Municipalities@data
aMeasure<-acc(attr$X[1:100], attr$Y[1:100],attr$PopTot01[1:100],1)



