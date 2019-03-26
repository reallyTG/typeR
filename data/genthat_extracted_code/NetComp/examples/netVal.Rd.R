library(NetComp)


### Name: netVal
### Title: Network Validation
### Aliases: netVal

### ** Examples

 #using the state.x77 and USArrest datasets
 arrestCor<-cor(t(USArrests))
 stateCor<-cor(t(state.x77))
 netVal(stateCor, arrestCor, method='ward', k=10)
 netVal(stateCor, stateCor, method='ward', k=10)



