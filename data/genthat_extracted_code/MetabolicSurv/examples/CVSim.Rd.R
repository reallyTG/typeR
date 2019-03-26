library(MetabolicSurv)


### Name: CVSim
### Title: Cross validation for sequentially increases metabolites
### Aliases: CVSim

### ** Examples

## No test: 
## FIRSTLY SIMULATING A METABOLIC SURVIVAL DATA
Data = MSData(nPatients = 100, nMet = 150, Prop = 0.5)

## GETTING THE cvmm OBJECT
Result = CVMetSpecificCoxPh(Fold=3,Survival=Data$Survival,
Mdata=t(Data$Mdata),Censor= Data$Censor,Reduce=TRUE,Select=150,
Prognostic=Data$Prognostic,Quantile = 0.5,Ncv=3)

## USING THE FUNCTION
 Result2 = CVSim(Result, Top = seq(5, 100, by = 5), Data$Survival,
 Data$Censor,Prognostic = Data$Prognostic)

## GET THE CLASS OF THE OBJECT
class(Result2)     # An "cvsim" Class
## End(No test)



