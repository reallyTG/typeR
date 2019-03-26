library(network)


### Name: as.sociomatrix
### Title: Coerce One or More Networks to Sociomatrix Form
### Aliases: as.sociomatrix
### Keywords: graphs manip

### ** Examples

#Generate an adjacency array
g<-array(rbinom(100,1,0.5),dim=c(4,5,5))

#Generate a network object
net<-network(matrix(rbinom(36,1,0.5),6,6))

#Coerce to adjacency matrix form using as.sociomatrix
as.sociomatrix(g,simplify=TRUE)   #Returns as-is
as.sociomatrix(g,simplify=FALSE)  #Returns as list
as.sociomatrix(net)               #Coerces to matrix
as.sociomatrix(list(net,g))       #Returns as list of matrices



