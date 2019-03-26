library(MetabolicSurv)


### Name: SurvPlsClass
### Title: Survival PLS and Classification for metabolic data
### Aliases: SurvPlsClass

### ** Examples

## FIRSTLY SIMULATING A METABOLIC SURVIVAL DATA
Data = MSData(nPatients = 100, nMet = 150, Prop = 0.5)

## USING THE FUNCTION
Result = SurvPlsClass(Survival=Data$Survival, Mdata=t(Data$Mdata),
Censor=Data$Censor, Reduce = FALSE, Select = 150,
Prognostic = Data$Prognostic, Plots = FALSE, Quantile = 0.5)

## GETTING THE SURVIVAL REGRESSION OUTPUT
Result$SurvFit

## GETTING THE RISKSCORES
Result$Riskscores

### GETTING THE RISKGROUP
Result$Riskgroup

### OBTAINING THE FIRST PRINCIPAL COMPONENT SCORES
Result$pc1



