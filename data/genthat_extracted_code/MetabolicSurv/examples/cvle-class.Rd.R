library(MetabolicSurv)


### Name: cvle-class
### Title: The cvle Class.
### Aliases: cvle-class cvle show,cvle-method summary,cvle-method
###   plot,cvle,missing-method

### ** Examples

## No test: 
## GENERATE SOME METABOLIC SURVIVAL DATA WITH PROGNOSTIC FACTORS
Data<-MSData(nPatients=100,nMet=150,Prop=0.5)

## USE THE FUNCTION
Eg = CVLasoelacox(Survival = Data$Survival,Censor = Data$Censor,
Mdata = t(Data$Mdata),Prognostic = Data$Prognostic, Quantile = 0.5,
Metlist = NULL,Standardize = TRUE, Reduce=FALSE, Select=15,
Alpha = 1,Fold = 4,Ncv = 10,nlambda = 100)

## GET THE CLASS OF THE OBJECT
class(Eg)     # An "cvle" Class

##  METHOD THAT CAN BE USED FOR THIS CLASS
show(Eg)
summary(Eg)
plot(Eg, type =3)
## End(No test)



