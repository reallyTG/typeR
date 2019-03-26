library(MetabolicSurv)


### Name: Lasoelacox
### Title: Wapper function for glmnet
### Aliases: Lasoelacox

### ** Examples

## FIRSTLY SIMULATING A METABOLIC SURVIVAL DATA
Data = MSData(nPatients = 100, nMet = 150, Prop = 0.5)

## USING THE FUNCTION
Results = Lasoelacox(Survival=Data$Survival, Censor=Data$Censor,
Mdata=t(Data$Mdata), Prognostic = Data$Prognostic, Quantile = 0.5,
Metlist = NULL, Plots = FALSE, Standardize = TRUE, Alpha = 1)

## VIEW THE SELECTED METABOLITES
Results$Selected.mets
## NUMBER OF SELECTED METABOLITES
Results$n

## VIEW THE CLASSIFICATION GROUP OF EACH SUBJECT
Results$Risk.Group

## VIEW THE SURVIVAL ANALYSIS RESULT
Results$SurvFit

## TO CHECK IF THERE WAS ANY SELECTION
Results$Select



