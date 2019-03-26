library(NetComp)


### Name: netUnion
### Title: Network Union
### Aliases: netUnion

### ** Examples

 #using the state.x77 and USArrest datasets
 #remove data from states for illustration
 ssArrest<-subset(t(USArrests), select=-c(Alabama,Colorado,Delaware))
 ssState<-subset(t(state.x77), select=-c(Alabama, Arizona, Iowa))
 arrestCor<-cor(ssArrest)
 stateCor<-cor(ssState)
 dataUnion<-netUnion(stateCor, arrestCor)
 dataUnion[1:15,1:5]
 #Setting a cutoff to remove any edges that are below 0.6 
 dataUnion.6<-netUnion(stateCor, arrestCor, cutoff=0.6)
 dataUnion.6[1:15,1:5]



