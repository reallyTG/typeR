library(FlexParamCurve)


### Name: FlexParamCurve-package
### Title: Tools to Fit Flexible Parametric Curves
### Aliases: FlexParamCurve-package
### Keywords: Curve fit Parametric curves Growth nlme nlsList double
###   logistic logistic equation positive negative curve

### ** Examples



#Code is provided here for an illustrative overview of using FlexParamCurve to select,  


# fit, analyze and plot the most appropriate non-linear curves for a dataset.


# NOTE: autorun is disabled for these examples since more detailed examples are provided for the 


# individual functions in their associated help files and runtime for this overview approximates 


# 5 mins. To run, simply copy and paste code from this help file into the R GUI.





# run all-model selection for posneg.data object (Step 2) without need to run any previous functions


## Not run: 
##D   
##D 
##D 
##D     modseltable <- pn.mod.compare(posneg.data$age, posneg.data$mass,
##D 
##D 
##D     posneg.data$id, existing = FALSE, pn.options = "myoptions")
## End(Not run)





# run backwards stepwise model selection (Step 2) for logist.data object


#without need to run any previous functions


## Not run: 
##D   
##D 
##D 
##D     modseltable <- pn.modselect.step(logist.data$age, logist.data$mass,
##D 
##D 
##D     logist.data$id, existing = FALSE, pn.options = "myoptions")
## End(Not run)





# estimate fixed parameters use data object posneg.data (Step 1)


## Not run: 
##D   
##D 
##D 
##D      modpar(posneg.data$age,posneg.data$mass, pn.options = "myoptions")
## End(Not run)





# change fixed values of M and constrain hatching mass to 45.5 in a growth curve (Step 1)


## Not run: 
##D   
##D 
##D 
##D       change.pnparameters(M=1,RM=0.5,first.y=45.5, pn.options = "myoptions")
## End(Not run)


    


# fit nlsList object using 6 parameter model with values M and RM (Step 3)


# fixed to value in pnmodelparams and then fit nlme model


## Not run: 
##D   
##D 
##D 
##D richardsR22.lis <- nlsList(mass ~ SSposnegRichards(age, Asym = Asym, K = K,
##D 
##D 
##D       Infl = Infl, RAsym = RAsym, Rk = Rk, Ri = Ri,
##D 
##D 
##D       modno = 22, pn.options = "myoptions"), data = posneg.data)
##D 
##D 
##D richardsR22.nlme <- nlme(richardsR22.lis, random = pdDiag(Asym + Infl ~ 1))
## End(Not run)


 


# fit reduced nlsList model and then compare performance with extraF (manual version of Step 2)


## Not run: 
##D   
##D 
##D 
##D  richardsR20.lis <- nlsList(mass ~ SSposnegRichards(age, Asym = Asym, K = K,
##D 
##D 
##D       Infl = Infl, modno = 20, pn.options = "myoptions"), data = posneg.data)
##D 
##D 
##D  extraF(richardsR20.lis,richardsR22.lis)
## End(Not run)


 


# fit and plot a logistic curve (M=1) to data, note - all parameters set to 1 are ignored


# note code here forces \eqn{modpar} to only estimate 4 curve parameters (simple Richards curve)


#create list for fixed parameters


## Not run: 
##D   
##D 
##D 
##D modpar(logist.data$age,logist.data$mass,force4par=TRUE, pn.options = "myoptions")
##D 
##D 
##D change.pnparameters(M=1, pn.options = "myoptions") # set M to 1 for subsequent fit
##D 
##D 
##D richardsR20.nls <- nls(mass ~ SSposnegRichards(age, Asym = Asym, K = K,
##D 
##D 
##D       Infl = Infl, modno = 20, pn.options = "myoptions"), data = logist.data)
##D 
##D 
##D plot(logist.data$age , logist.data$mass, xlab = "age", ylab = "mass", pch = ".", cex = 0.7) 
##D 
##D 
##D par <- coef( richardsR20.nls )
## End(Not run)





#(Step 4)


## Not run: 
##D   
##D 
##D 
##D curve(posnegRichards.eqn(x, Asym = par[1], K = par[2], Infl = par[3], modno = 20
##D 
##D 
##D , pn.options = "myoptions"), add= TRUE)
## End(Not run)





