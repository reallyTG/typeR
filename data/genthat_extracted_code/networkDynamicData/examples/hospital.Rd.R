library(networkDynamicData)


### Name: hospital
### Title: Hospital ward dynamic contact network
### Aliases: hospital hospital_contact
### Keywords: datasets

### ** Examples

data(hospital_contact)
## Not run: 
##D # get an overview of temporal density
##D plot(table(get.edge.activity(hospital,as.spellList=TRUE)[,1]),
##D xlab='time',ylab='activity count',col="#00000055")
##D 
##D # define a mapping of roles to colors
##D rolecolors<-function(roles){
##D   roles[roles=='NUR']<-'blue'
##D   roles[roles=='PAT']<-'gray'
##D   roles[roles=='MED']<-'green'
##D   roles[roles=='ADM']<-'orange'
##D   return(roles)
##D }
##D 
##D # network plot aggregating across all days
##D slice<-network.collapse(hospital,rm.time.info=FALSE)
##D plot(slice,vertex.col=rolecolors(slice%v%'role'),
##D   edge.lwd=slice%e%'activity.duration'/300,edge.col='#00000044')
##D   
##D # plot one hour of interaction
##D plot(network.extract(hospital,onset=160000,terminus=163600),
##D vertex.cex=0.5,vertex.col=rolecolors(hospital%v%'role'))
## End(Not run)



