library(MetabolicSurv)


### Name: MSpecificCoxPh
### Title: Metabolite by metabolite Cox proportional analysis
### Aliases: MSpecificCoxPh

### ** Examples

## FIRSTLY SIMULATING A METABOLIC SURVIVAL DATA
Data = MSData(nPatients = 100, nMet = 150, Prop = 0.5)

## USING THE FUNCTION
Example1 = MSpecificCoxPh(Survival = Data$Survival,
Mdata = t(Data$Mdata), Censor = Data$Censor, Reduce = FALSE,
Select = 15,Prognostic = Data$Prognostic, Quantile = 0.5)

## KNOWLING THE CLASS OF THE OUTPUT
class(Example1)

## EXTRACTING THE COMPONENT OF THE FUNCTION
### HAZARD RATIO INFORMATION FOR EACH METABOLITES
Example1@HRRG

### COX MODEL RESULT FOR EACH METABOLITES
Example1@Result

### CLASSIFICATION FOR EACH METABOLITES
Example1@Group



