library(networkDynamic)


### Name: when.vertex.attrs.match
### Title: return the times at which the TEA attributes of elements of a
###   network match a value
### Aliases: when.vertex.attrs.match when.edge.attrs.match

### ** Examples


# create a network with TEA attribute
net<-network.initialize(5)
net<-activate.vertex.attribute(net,'test','A',onset=0,terminus=2)
net<-activate.vertex.attribute(net,'test','B',onset=2,terminus=3)
net<-activate.vertex.attribute(net,'test','C',onset=4,terminus=5)

net<-activate.vertex.attribute(net,'weight',0,onset=-Inf,terminus=Inf)
net<-activate.vertex.attribute(net,'weight',-1,at=6,v=2)

# when does 'test' take the value 'B' for each vertex?
when.vertex.attrs.match(net,'test',value='B')

# when is the terminus of when 'test' takes a value 'A' or 'C'?
when.vertex.attrs.match(net,'test',value=c('A','C'),match.op='%in%',rule='latest')

# when does 'weight' first take a value less than 0?
when.vertex.attrs.match(net,'weight',value=0,match.op='<')




