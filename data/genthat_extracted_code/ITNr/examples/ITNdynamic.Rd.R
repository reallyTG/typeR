library(ITNr)


### Name: ITNdynamic
### Title: Dynamic ITN
### Aliases: ITNdynamic

### ** Examples

require(igraph)

##Create a set of random International Trade Networks (igraph objects)
##and add vertex names
ITN1<-erdos.renyi.game(75,0.05,directed = TRUE)
V(ITN1)$name<-1:vcount(ITN1)
ITN2<-erdos.renyi.game(100,0.01,directed = TRUE)
V(ITN2)$name<-1:vcount(ITN2)
ITN3<-erdos.renyi.game(55,0.1,directed = TRUE)
V(ITN3)$name<-1:vcount(ITN3)

##Create network list
NETlist<-list(ITN1,ITN2,ITN3)

##Create Dynamic Network Object

ITNdyn<-ITNdynamic(NETlist)




