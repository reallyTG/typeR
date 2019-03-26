library(network)


### Name: network.vertex
### Title: Add Vertices to a Plot
### Aliases: network.vertex
### Keywords: aplot graphs

### ** Examples


#Open a plot window, and place some vertices
plot(0,0,type="n",xlim=c(-1.5,1.5),ylim=c(-1.5,1.5),asp=1)
network.vertex(cos((1:10)/10*2*pi),sin((1:10)/10*2*pi),col=1:10,
    sides=3:12,radius=0.1)




