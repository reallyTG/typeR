library(NetComp)


### Name: netDiff
### Title: Network Difference
### Aliases: netDiff

### ** Examples

 #using the state.x77 and USArrest datasets
 #remove data from states for illustration
 ssArrest<-subset(t(USArrests), select=-c(Alabama,Colorado,Delaware))
 ssState<-subset(t(state.x77), select=-c(Alabama, Arizona, Iowa))
 arrestCor<-cor(ssArrest)
 stateCor<-cor(ssState)
 dataDiff<-netDiff(stateCor, arrestCor)
 dataDiff[1:15,1:5]
 #Setting a cutoff to remove any edges that are below 0.6 
 dataDiff.6<-netDiff(stateCor, arrestCor, cutoff=0.6)
 dataDiff.6[1:15,1:5]



