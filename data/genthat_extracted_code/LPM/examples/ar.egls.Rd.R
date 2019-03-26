library(LPM)


### Name: ar.egls
### Title: Subset Autoregressive Model
### Aliases: ar.egls

### ** Examples

##	S1=matrix(0,3,3)
##	S1[1,1]=1
##	S1[1,2]=1
##	S=list()
##	S[[1]]=S1
##	S[[2]]=S1
##	ar.egls(series.rainfall[,1:3],S,order.max=2)
## --> Apply a Subset VAR(2) model restricted to 4 parameters (position (1,1)
## --> and (1,2) in both matrices) to first 3 series of series.rainfall 
## --> dataset  


