library(MetabolicSurv)


### Name: cvmv-class
### Title: The cvmv Class.
### Aliases: cvmv-class cvmv show,cvmv-method summary,cvmv-method
###   plot,cvmv,ANY-method

### ** Examples

## No test: 
## GENERATE SOME METABOLIC SURVIVAL DATA WITH PROGNOSTIC FACTORS
Data<-MSData(nPatients=100,nMet=150,Prop=0.5)

## USING THE FUNCTION
Result = CVMajorityvotes(Survival=Data$Survival,Censor=Data$Censor,
Prognostic=Data$Prognostic, Mdata=t(Data$Mdata), Reduce=FALSE,
Select=15, Fold=3, Ncv=10)

## GET THE CLASS OF THE OBJECT
class(Result)     # A "cvmv" Class

##  METHOD THAT CAN BE USED FOR THE RESULT
show(Result)
summary(Result)
plot(Result)
## End(No test)



