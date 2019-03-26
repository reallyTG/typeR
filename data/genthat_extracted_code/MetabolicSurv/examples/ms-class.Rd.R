library(MetabolicSurv)


### Name: ms-class
### Title: The ms Class.
### Aliases: ms-class ms show,ms-method summary,ms-method
###   plot,ms,ANY-method

### ** Examples

## GENERATE SOME METABOLIC SURVIVAL DATA WITH PROGNOSTIC FACTORS
Data<-MSData(nPatients=100,nMet=150,Prop=0.5)

## DO THE METABOLITE BY METABOLITE ANALYSIS
Eg = MSpecificCoxPh(Survival=Data$Survival, Mdata=t(Data$Mdata),
Censor=Data$Censor, Reduce = FALSE, Select = 15,
Prognostic=Data$Prognostic, Quantile = 0.5)

## GET THE CLASS OF THE OBJECT
class(Eg)     # An "ms" Class

##  METHOD THAT CAN BE USED FOR THIS CLASS
show(Eg)
summary(Eg)
plot(Eg)



