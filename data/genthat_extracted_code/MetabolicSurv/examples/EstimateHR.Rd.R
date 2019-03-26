library(MetabolicSurv)


### Name: EstimateHR
### Title: Classification, Survival Estimation and Visualization
### Aliases: EstimateHR

### ** Examples

### Classification and estimating with prognostic factors
data(DataHR)
Result = EstimateHR(Risk.Scores=DataHR[,1],Data.Survival=DataHR[,2:3]
,Prognostic=DataHR[,4:5],Plots=FALSE,Quantile=0.50)

### Classification and estimating without prognostic factors
data(DataHR)
Result = EstimateHR(Risk.Scores=DataHR[,1],Data.Survival=DataHR[,2:3]
,Prognostic=NULL,Plots=FALSE,Quantile=0.50)



