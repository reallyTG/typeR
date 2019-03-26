library(MetabolicSurv)


### Name: CVMetSpecificCoxPh
### Title: Cross validation for the Metabolite specific analysis
### Aliases: CVMetSpecificCoxPh

### ** Examples

## No test: 
## FIRSTLY SIMULATING A METABOLIC SURVIVAL DATA
Data = MSData(nPatients = 100, nMet = 150, Prop = 0.5)

## USING THE FUNCTION
Result = CVMetSpecificCoxPh(Fold=3,Survival=Data$Survival,
Mdata=t(Data$Mdata),Censor= Data$Censor,Reduce=TRUE,
Select=150,Prognostic=Data$Prognostic,Quantile = 0.5,Ncv=3)

## GET THE CLASS OF THE OBJECT
class(Result)     # An "cvmm" Class

##  METHOD THAT CAN BE USED FOR THE RESULT
show(Result)
summary(Result)
plot(Result)
## End(No test)



