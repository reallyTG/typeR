library(MetabolicSurv)


### Name: CVLasoelacox
### Title: Cross Validations for Lasso Elastic Net Survival predictive
###   models and Classification
### Aliases: CVLasoelacox

### ** Examples

## No test: 
## FIRSTLY SIMULATING A METABOLIC SURVIVAL DATA
Data = MSData(nPatients = 100, nMet = 150, Prop = 0.5)

## USING THE FUNCTION
Results = CVLasoelacox(Survival = Data$Survival,Censor = Data$Censor,
Mdata = t(Data$Mdata),Prognostic = Data$Prognostic, Quantile = 0.5,
Metlist = NULL,Standardize = TRUE, Reduce=FALSE, Select=15,
Alpha = 1,Fold = 4,Ncv = 10,nlambda = 100)

## NUMBER OF SELECTED METABOLITES PER CV
Results@n

## GET THE MATRIX OF COEFFICIENTS
Results@Coef.mat

## SURVIVAL INFORMATION OF THE TRAIN DATASET
Results@HRTrain

## SURVIVAL INFORMATION OF THE TEST DATASET
Results@HRTest
## End(No test)



