library(Metatron)


### Name: fit.bivar
### Title: Fit the Bivariate Model of Reitsma et al. (2005)
### Aliases: fit.bivar print.fit.bivar summary.fit.bivar
### Keywords: bivariate model

### ** Examples

## fit bivariate model without covariate to data from a review(Nishimura 2007) 
 data(ccp)
(ccp.without<-fit.bivar(TP=TP,FN=FN,TN=TN,FP=FP,study=study_id,data=ccp))
summary(ccp.without)
## fit bivariate model with covariate "generation" to the same data set.
(ccp.generation<-fit.bivar(TP=TP,FN=FN,TN=TN,FP=FP,study=study_id,data=ccp,mods=generation,
                           covarying="both"))
summary(ccp.generation)
##fit bivariate model with covariate "Test" to the data from Schuetz(2010) 
##comparing the accuracy of CI and MRI
data(Schuetz)
(CTvsMRI<-fit.bivar(TP=tp,FN=fn,TN=tn,FP=fp,study=Study_ID,data=Schuetz,mods=Test))
 summary(CTvsMRI)



