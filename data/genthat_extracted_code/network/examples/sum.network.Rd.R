library(network)


### Name: sum.network
### Title: Combine Networks by Edge Value Addition
### Aliases: sum.network
### Keywords: arith graphs

### ** Examples

#Create some networks
g<-network.initialize(5)
h<-network.initialize(5)
i<-network.initialize(5)
g[1,,names.eval="marsupial",add.edges=TRUE]<-1
h[1:2,,names.eval="marsupial",add.edges=TRUE]<-2
i[1:3,,names.eval="marsupial",add.edges=TRUE]<-3

#Combine by addition
pouch<-sum(g,h,i,attrname="marsupial")
pouch[,]                                   #Edge values in the pouch?
as.sociomatrix(pouch,attrname="marsupial")     #Recover the marsupial



