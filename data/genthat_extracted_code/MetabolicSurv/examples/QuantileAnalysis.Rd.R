library(MetabolicSurv)


### Name: QuantileAnalysis
### Title: Quantile sensitivity analysis
### Aliases: QuantileAnalysis

### ** Examples

## No test: 
## FIRSTLY SIMULATING A METABOLIC SURVIVAL DATA
Data = MSData(nPatients = 100, nMet = 150, Prop = 0.5)

## USING THE PCA METHOD
Result = QuantileAnalysis(Data$Survival,t(Data$Mdata),
Data$Censor,Reduce=FALSE, Select=150, Prognostic=Data$Prognostic,
Plots = TRUE,DimMethod="PCA",Alpha=1)

## USING THE PLS METHOD
Result = QuantileAnalysis(Data$Survival,t(Data$Mdata),
Data$Censor,Reduce=FALSE, Select=150, Prognostic=Data$Prognostic,
Plots = TRUE,DimMethod="PLS",Alpha=1)

## USING THE SM METHOD
Result = QuantileAnalysis(Data$Survival,t(Data$Mdata),
Data$Censor,Reduce=FALSE, Select=150, Prognostic=Data$Prognostic,
Plots = FALSE,DimMethod="SM",Alpha=1)
## End(No test)



