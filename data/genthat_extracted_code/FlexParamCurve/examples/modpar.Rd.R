library(FlexParamCurve)


### Name: modpar
### Title: Estimate Values to be Used for Fixed FlexParamCurve Parameters
### Aliases: modpar

### ** Examples



# estimate fixed parameters use data object posneg.data


   	 modpar(posneg.data$age, posneg.data$mass, pn.options = "myoptions")





# estimate fixed parameters use data object posneg.data (only first 


# 4 group levels for example's sake) and specify a fixed hatching 


# mass for curve optimization using \code{SSposnegRichards}


	 modpar(posneg.data$age, posneg.data$mass, pn.options = "myoptions")


   	 subdata <- subset(posneg.data,posneg.data$id == as.character(36)


	    		| posneg.data$id == as.character(9) 


	    		| posneg.data$id == as.character(32) 


	    		| posneg.data$id == as.character(43))


	 richardsR22.lis <- nlsList(mass ~ SSposnegRichards(age, Asym = Asym, 


	         K = K, Infl = Infl, RAsym = RAsym, Rk = Rk, Ri = Ri, 


        	 modno = 22, pn.options = "myoptions"), data = subdata)


   		 





# force an 8 parameter estimate on logistic data


modpar(logist.data$age,logist.data$mass,force8par=TRUE, pn.options = "myoptions")








# force an 4 parameter model on logistic data


modpar(logist.data$age,logist.data$mass,force4par=TRUE, pn.options = "myoptions")





# troubleshoot the fit of a model 


modpar(posneg.data$age,posneg.data$mass,verbose=TRUE, pn.options = "myoptions")





# fit a two component model - enter your own data in place of "mydata"


        # this details an approach but is not run for want of appropriate data


        # if x of intersection unknown


        ## Not run: 
##D 
##D 
##D  	modpar(mydata$x,mydata$y,twocomponent.x=TRUE, pn.options = "myoptions")
##D 
##D 
##D         # if x of intersection = 75
##D 
##D 
##D  	modpar(mydata$x,mydata$y,twocomponent.x=75, pn.options = "myoptions")
##D 
##D 
##D  	richardsR1.nls <- nls(y~ SSposnegRichards(x, Asym = Asym, K = K,
##D 
##D 
##D                  Infl = Infl, M = M, RAsym = RAsym, Rk = Rk, Ri = Ri, RM = RM,
##D 
##D 
##D                  modno = 1, pn.options = "myoptions")
##D 
##D 
##D                  , data = mydata)
## End(Not run)





