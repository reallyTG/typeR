library(network)


### Name: network.operators
### Title: Network Operators
### Aliases: network.operators +.network -.network *.network !.network
###   |.network &.network %c% %c%.network
### Keywords: math graphs

### ** Examples

#Create an in-star
m<-matrix(0,6,6)
m[2:6,1]<-1
g<-network(m)
plot(g)

#Compose g with its transpose
gcgt<-g %c% (network(t(m)))
plot(gcgt)
gcgt

#Show the complement of g
!g

#Perform various arithmatic and logical operations
(g+gcgt)[,] == (g|gcgt)[,]             #All TRUE
(g-gcgt)[,] == (g&(!(gcgt)))[,]
(g*gcgt)[,] == (g&gcgt)[,]



