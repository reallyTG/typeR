library(network)


### Name: get.inducedSubgraph
### Title: Retrieve Induced Subgraphs and Cuts
### Aliases: %s% get.inducedSubgraph
### Keywords: graphs manip

### ** Examples

#Load the Drabek et al. EMON data
data(emon)

#For the Mt. St. Helens, EMON, several types of organizations are present:
type<-emon$MtStHelens %v% "Sponsorship"

#Plot interactions among the state organizations
plot(emon$MtStHelens %s% which(type=="State"), displaylabels=TRUE)

#Plot state/federal interactions
plot(emon$MtStHelens %s% list(which(type=="State"), 
    which(type=="Federal")),  displaylabels=TRUE)

#Plot state interactions with everyone else
plot(emon$MtStHelens %s% list(which(type=="State"), 
    which(type!="State")), displaylabels=TRUE)
    
# plot only interactions with frequency of 2
subG2<-get.inducedSubgraph(emon$MtStHelens,
            eid=which(emon$MtStHelens%e%'Frequency'==2))
plot(subG2,edge.label='Frequency')




