library(MetabolicSurv)


### Name: cvsim-class
### Title: The cvsim Class.
### Aliases: cvsim-class cvsim show,cvsim-method summary,cvsim-method
###   plot,cvsim,missing-method

### ** Examples

## No test: 
## GENERATE SOME METABOLIC SURVIVAL DATA WITH PROGNOSTIC FACTORS
Data<-MSData(nPatients=100,nMet=150,Prop=0.5)

## FIRST IS THE NETABOLITE BY METABOLITE ANALYSIS
w = CVMetSpecificCoxPh(Fold=3,Survival=Data$Survival,
Mdata=t(Data$Mdata),Censor= Data$Censor,Reduce=TRUE,
Select=150,Prognostic=Data$Prognostic,Quantile = 0.5,Ncv=3)

## USING THE FUNCTION
Result = CVSim(w, Top = seq(5, 100, by = 5), Survival=Data$Survival,
 Censor=Data$Censor, Prognostic = Data$Prognostic)

## GET THE CLASS OF THE OBJECT
class(Result)     # A "cvsim" Class

##  METHOD THAT CAN BE USED FOR THE RESULT
show(Result)
summary(Result)
plot(Result, type =2)
## End(No test)



