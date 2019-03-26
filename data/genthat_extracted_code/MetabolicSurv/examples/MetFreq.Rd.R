library(MetabolicSurv)


### Name: MetFreq
### Title: Frequency of Selected Metabolites from the Metabolite specific
###   Cross Validation
### Aliases: MetFreq

### ** Examples

## No test: 
## FIRSTLY SIMULATING A METABOLIC SURVIVAL DATA
Data = MSData(nPatients = 100, nMet = 150, Prop = 0.5)

## METABOLITE SPECIFIC CROSS VALIDATION
Result = CVMetSpecificCoxPh(Fold=3,Survival=Data$Survival,
Mdata=t(Data$Mdata),Censor= Data$Censor,Reduce=FALSE,
Select=15,Prognostic=Data$Prognostic,Quantile = 0.5,Ncv=30)

## CONFIRMING THE CLASS
class(Result)

## USING THE FUNCTION
MetFreq(Result,TopK = 5,Minfreq = 20, N=5)
## End(No test)



