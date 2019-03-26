library(MetabolicSurv)


### Name: CVPcaPls
### Title: Cross Validations for PCA and PLS based methods
### Aliases: CVPcaPls

### ** Examples

## FIRSTLY SIMULATING A METABOLIC SURVIVAL DATA
Data = MSData(nPatients = 100, nMet = 150, Prop = 0.5)

## USING THE FUNCTION
Result = CVPcaPls(Fold = 4, Survival = Data$Survival,
Mdata = t(Data$Mdata), Censor = Data$Censor, Reduce=TRUE,
Select=19, Prognostic= Data$Prognostic,Ncv=55,DR ="PLS")

## GET THE CLASS OF THE OBJECT
class(Result)     # An "cvpp" Class

##  METHOD THAT CAN BE USED FOR THE RESULT
show(Result)
summary(Result)
plot(Result)



