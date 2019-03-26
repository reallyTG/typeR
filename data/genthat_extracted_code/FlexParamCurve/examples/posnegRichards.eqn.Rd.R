library(FlexParamCurve)


### Name: posnegRichards.eqn
### Title: Equations of the FlexParamCurve Family
### Aliases: posnegRichards.eqn

### ** Examples



require(graphics)


# calculate y (dependent variable) for a given x for an 8-parameter double-Richards model


         #create pnmodelparams for fixed parameters 


   	 modpar(posneg.data$age, posneg.data$mass, pn.options = "myoptions")


   	 x = 10


   	 y <- posnegRichards.eqn(x, 1000, 0.5, 25, 1, 100, 0.5, 125, 


   	 1, modno = 1, pn.options = "myoptions")


   	 print( c(x = x, y = y) )


   	 


# plot 8-parameter model using saved parameter values from modpar


	 plot(posneg.data$age, posneg.data$mass, pch = ".")


	 curve(posnegRichards.eqn(x,modno = 1, pn.options = "myoptions"), add = TRUE, lwd = 3)


	 


# plot 3-parameter model using saved parameter values from modpar


         curve(posnegRichards.eqn(x,modno = 32, pn.options = "myoptions"), add = TRUE, col =2


               , lwd = 3)


	 


# tweak the plot of a 3-parameter model by user specifying a lower asymptote:


#      ie give some parameter values


# directly and others through pn.options by default


         curve(posnegRichards.eqn(x,modno = 32, Asym = 3200, pn.options = "myoptions"),


               add = TRUE, col = 5, lwd = 3)


	 


# calculate y (dependent variable) for a given x for a 4-parameter Richards model 


# (note that second curve parameters are unneeded) and replaced with value from pn.options.


# User-supplied variables over-ride those stored in pn.options object


	 x = 10


   	 y <- posnegRichards.eqn(x, 1000, 0.5, 25, 1, 


   	 1, modno = 12, pn.options = "myoptions")


   	 print( c(x = x, y = y) )


   	 


# plot a logistic curve (M=1),  note that second curve parameters are unneeded


         plot(1:200, posnegRichards.eqn(1:200, Asym = 1000, K = 0.5, Infl = 25, M = 1, 


   	         modno = 12, pn.options = "myoptions"), xlim = c(1, 200), xlab = "x", 


   		 ylab = "y", pch = 1, cex = 0.7)





# plot a double-logistic curve (M=1, RM=1),  


#note that second curve parameters are unneeded 	     


   	 plot(1:200, posnegRichards.eqn(1:200, Asym = 1000, K = 0.5, Infl = 25, M = 1,


   	      RAsym = -100, Rk = 0.5, Ri = 125, RM = 1,


   	      modno = 1, pn.options = "myoptions"), xlim = c(1, 200), xlab = "x", 


   		 ylab = "y", pch = 1, cex = 0.7)





