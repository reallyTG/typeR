library(MetabolicSurv)


### Name: fcv-class
### Title: The fcv Class.
### Aliases: fcv-class fcv show,fcv-method summary,fcv-method
###   plot,fcv,missing-method

### ** Examples

## No test: 
## GENERATE SOME METABOLIC SURVIVAL DATA WITH PROGNOSTIC FACTORS
Data<-MSData(nPatients=100,nMet=150,Prop=0.5)

## USE THE FUNCTION
Eg = Icvlasoel(Data$Survival, Data$Censor, Data$Prognostic,
t(Data$Mdata), Fold = 3,Ncv = 5, Nicv = 7, Alpha = 1,
TopK = colnames(Data$Mdata[,80:100]), Weights = FALSE)

## GET THE CLASS OF THE OBJECT
class(Eg)     # An "fcv" Class

##  METHOD THAT CAN BE USED FOR THIS CLASS
show(Eg)
summary(Eg)
plot(Eg, type =1)
## End(No test)



