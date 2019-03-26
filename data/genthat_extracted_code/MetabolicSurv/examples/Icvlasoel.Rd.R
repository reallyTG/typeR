library(MetabolicSurv)


### Name: Icvlasoel
### Title: Inner and Outer Cross Validations for Lasso Elastic Net Survival
###   predictive models and Classification
### Aliases: Icvlasoel

### ** Examples

## No test: 
## FIRSTLY SIMULATING A METABOLIC SURVIVAL DATA
Data = MSData(nPatients = 100, nMet = 150, Prop = 0.5)

## USING THE FUNCTION
Results = Icvlasoel(Data$Survival, Data$Censor, Data$Prognostic,
t(Data$Mdata), Fold = 3,Ncv = 5, Nicv = 7, Alpha = 1,
TopK = colnames(Data$Mdata[,80:100]), Weights = FALSE)

## NUMBER OF Outer CV
Results@Ncv
## NUMBER OF Inner CV
Results@Nicv

## HR of low risk group for the Inner CV
Results@HRInner

## HR of low risk group for the out of bag dataset
Results@HRTest

## The weight for the analysis
Results@Weight
## End(No test)



