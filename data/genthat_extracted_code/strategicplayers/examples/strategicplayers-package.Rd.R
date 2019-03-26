library(strategicplayers)


### Name: strategicplayers-package
### Title: Strategic Players
### Aliases: strategicplayers-package strategicplayers
### Keywords: package

### ** Examples


require(sna)

network<-rgraph(20, tprob=.2)         #generate a bernoulli random network on 20 nodes
geo<-geodist(network)[2]$gdist        #get the geodesic distances of the network
targets<-1:10                         #defining the target group
avoids<-11:14                         #defining the avoidance group
theta<-.8                             #defining the theta parameter

spset<-sp(4, geo, targets, avoids, theta, n.loops=100)  #find sp set of size 4
spset

distance(geo, targets, avoids, theta, spset)          #calculates distance metric for spset

#plot the network with the strategic player set highlighted in yellow
colors<-rep("white", 20)
colors[targets]<-"green"
colors[avoids]<-"red"
colors[spset]<-"yellow"
par(mar=c(1,1,1,1))
gplot(network, vertex.col=colors, usearrows=FALSE, 
      edge.col="grey", vertex.border="grey", vertex.cex=1.7, pad=0, label=1:dim(network)[1])





