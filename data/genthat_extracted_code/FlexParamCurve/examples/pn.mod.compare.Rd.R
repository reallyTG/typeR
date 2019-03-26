library(FlexParamCurve)


### Name: pn.mod.compare
### Title: Compare All Possible Positive-Negative Richards nlslist Models
### Aliases: pn.mod.compare

### ** Examples



## No test: 


#these examples will take a long while to run as they have to complete the 32 model comparison


#run model selection for posneg.data object (only first 3 group levels for example's sake)


   try(rm(myoptions),silent = TRUE)


   subdata <- subset(posneg.data, as.numeric(row.names (posneg.data) ) < 40)


   modseltable <- pn.mod.compare(subdata$age, subdata$mass,


      subdata$id, existing = FALSE, pn.options = "myoptions")


   modseltable


   


#fit nlsList model initially and then run model selection


#for posneg.data object when at least one model is already fit


#(only first 3 group levels for example's sake)


    richardsR22.lis <- nlsList(mass ~ SSposnegRichards(age, Asym = Asym, K = K,


      Infl = Infl, RAsym = RAsym, Rk = Rk, Ri = Ri , modno = 22, pn.options = "myoptions")


                        ,data = subdata)


   modseltable <- pn.mod.compare(subdata$age, subdata$mass,


      subdata$id, forcemod = 3, existing = TRUE, pn.options = "myoptions")


   modseltable





#run model selection ranked by residual standard error*(1/sample size)


    modseltable <- pn.mod.compare(subdata$age, subdata$mass,


      subdata$id, penaliz='1*(1/n)', existing = TRUE, pn.options = "myoptions")


    modseltable


    
## End(No test)





