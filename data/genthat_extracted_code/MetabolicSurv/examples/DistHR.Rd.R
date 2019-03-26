library(MetabolicSurv)


### Name: DistHR
### Title: Null Distribution of the Estimated HR
### Aliases: DistHR

### ** Examples

## No test: 
## FIRSTLY SIMULATING A METABOLIC SURVIVAL DATA
Data = MSData(nPatients = 100, nMet = 150, Prop = 0.5)

## USING THE FUNCTION
Example <- DistHR(Survival = Data$Survival,Mdata = t(Data$Mdata),
Censor = Data$Censor,Reduce=FALSE,Select=15,Prognostic=Data$Prognostic,
Quantile = 0.5, nperm=10, case=2, Validation=c("L1based"))
## End(No test)



