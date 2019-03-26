library(MetabolicSurv)


### Name: Majorityvotes
### Title: Classifiction for Majority Votes
### Aliases: Majorityvotes

### ** Examples

## FIRSTLY SIMULATING A METABOLIC SURVIVAL DATA
Data = MSData(nPatients = 100, nMet = 150, Prop = 0.5)

## RUNNING THE METABOLITE SPECIFIC FUNCTION
Example1 = MSpecificCoxPh(Survival = Data$Survival,
Mdata = t(Data$Mdata), Censor = Data$Censor, Reduce = FALSE,
Select = 15,Prognostic = Data$Prognostic, Quantile = 0.5)

## USING THE FUNCTION
Result2 = Majorityvotes(Example1,Data$Prognostic, Data$Survival,Data$Censor,J=2)

## THE SURVIVAL ANALYSIS FOR MAJORITY VOTE RESULT
 Result2$Model.result

### THE MAJORITY VOTE FOR EACH SUBJECT
Result2$N

### THE MAJORITY VOTE CLASSIFICATION FOR EACH SUBJECT
Result2$Classif

### THE GROUP FOR EACH SUBJECT BASED ON THE METABOLITE SPPECIFIC ANALYSIS
Result2$Group



