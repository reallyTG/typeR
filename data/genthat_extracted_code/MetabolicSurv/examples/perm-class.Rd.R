library(MetabolicSurv)


### Name: perm-class
### Title: The perm Class.
### Aliases: perm-class perm show,perm-method summary,perm-method
###   plot,perm,ANY-method

### ** Examples

## No test: 
## GENERATE SOME METABOLIC SURVIVAL DATA WITH PROGNOSTIC FACTORS
Data<-MSData(nPatients=100,nMet=150,Prop=0.5)

## USING THE FUNCTION
Example <- DistHR(Survival = Data$Survival,Mdata = t(Data$Mdata),
Censor = Data$Censor,Reduce=FALSE,Select=15,Prognostic=Data$Prognostic,
Quantile = 0.5, nperm=10, case=2, Validation=c("L1based"))

## GET THE CLASS OF THE OBJECT
class(Example)     # A "perm" Class

##  METHOD THAT CAN BE USED FOR THIS CLASS
show(Example)
summary(Example)
plot(Example)
## End(No test)



