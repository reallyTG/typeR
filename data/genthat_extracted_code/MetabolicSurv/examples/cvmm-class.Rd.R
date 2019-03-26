library(MetabolicSurv)


### Name: cvmm-class
### Title: The cvmm Class.
### Aliases: cvmm-class cvmm show,cvmm-method summary,cvmm-method
###   plot,cvmm,ANY-method

### ** Examples

## No test: 
## GENERATE SOME METABOLIC SURVIVAL DATA WITH PROGNOSTIC FACTORS
Data<-MSData(nPatients=100,nMet=150,Prop=0.5)

## USING THE FUNCTION
Result = CVMetSpecificCoxPh(Fold=3,Survival=Data$Survival,
Mdata=t(Data$Mdata),Censor= Data$Censor,Reduce=TRUE,
Select=150,Prognostic=Data$Prognostic,Quantile = 0.5,Ncv=3)

## GET THE CLASS OF THE OBJECT
class(Result)     # An "cvmm" Class

##  METHOD THAT CAN BE USED FOR THIS CLASS
show(Result)
summary(Result)
plot(Result)
## End(No test)



