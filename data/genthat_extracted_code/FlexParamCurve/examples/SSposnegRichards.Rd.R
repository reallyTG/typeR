library(FlexParamCurve)


### Name: SSposnegRichards
### Title: Self-Starting Positive-Negative Richards Model (double-Richards)
### Aliases: SSposnegRichards

### ** Examples


 set.seed(3) #for compatability issues

 require(graphics)

    # retrieve mean estimates of 8 parameters using getInitial

    # and posneg.data object

    modpar(posneg.data$age, posneg.data$mass,verbose=TRUE, pn.options = "myoptions", width.bounds=2)

    getInitial(mass ~ SSposnegRichards(age, Asym, K, Infl, M, 

        RAsym, Rk, Ri, RM, modno = 1, pn.options = "myoptions"), data = posneg.data)



    # retrieve mean estimates and produce plot to illustrate fit for 

    # curve with M, Ri and Rk fixed

    pars <- coef(nls(mass ~ SSposnegRichards(age, 

        Asym = Asym, K = K, Infl = Infl, RAsym = RAsym, 

        	RM = RM, modno = 24, pn.options = "myoptions"), data = posneg.data,

        	control=list(tolerance = 10)))

    plot(posneg.data$age, posneg.data$mass, pch=".")

    curve(posnegRichards.eqn(x, Asym = pars[1], K = pars[2], 

        Infl = pars[3], RAsym = pars[4],  

        RM = pars[5],  modno = 24, pn.options = "myoptions"), xlim = c(0, 

        200), add = TRUE)

    



    

        # following example not run as appropriate data are not available in the package

        # retrieve mean estimates and produce plot to illustrate fit for custom model 17

     ## Not run: 
##D  
##D 
##D      pars<-as.numeric( getInitial(mass ~ SSposnegRichards(age, Asym, K, Infl,
##D 
##D            M, RAsym, Rk, Ri, RM, modno = 17, pn.options = "myoptions"), data = datansd) )
##D 
##D      plot(datansd$jday21March, datansd$moosensd)
##D 
##D      curve( posnegRichards.eqn(x, Asym = pars[1], K = 1, Infl = pars[2], 
##D 
##D             M = pars[3], RAsym = pars[4], Rk = 1, Ri = pars[5], RM = pars[6], 
##D 
##D             modno = 17, pn.options = "myoptions"), lty = 3, xlim = c(0, 200) , add = TRUE)
## End(Not run)

        

    # fit nls object using 8 parameter model

    # note: ensure data object is a groupedData object

   ## No test: 
 
   
        richardsR1.nls <- nls(mass ~ SSposnegRichards(age, Asym = Asym, 

        K = K, Infl = Infl, M = M, RAsym = RAsym, Rk = Rk, Ri = Ri, 

        RM = RM, modno = 1, pn.options = "myoptions"), data = posneg.data)
## End(No test)

        



    # following example not run as it fits very few levels in these data - as noted

    # such a comprehensive equation is rarely required

    # fit nlsList object using 8 parameter model

    # note: ensure data object is a groupedData object

    # also note: not many datasets require all 8 parameters

         ## Not run: 
##D 
##D          richardsR1.lis <- nlsList(mass ~ SSposnegRichards(age, Asym = Asym, 
##D 
##D         K = K, Infl = Infl, M = M, RAsym = RAsym, Rk = Rk, Ri = Ri, 
##D 
##D         RM = RM, modno = 1, pn.options = "myoptions"), data = posneg.data)
##D 
##D     summary(richardsR1.lis)
## End(Not run)



    # fit nlsList object using 6 parameter model with value M and RM

    # fixed to value in pnmodelparams and then fit nlme model

    # note data is subset to provide estimates for a few individuals

    # as an example
    
    ## No test: 
 

    subdata <- subset(posneg.data,posneg.data$id == as.character(26)

   		| posneg.data$id == as.character(1) 

   		| posneg.data$id == as.character(32))

    richardsR22.lis <- nlsList(mass ~ SSposnegRichards(age, Asym = Asym, 

        K = K, Infl = Infl, RAsym = RAsym, Rk = Rk, Ri = Ri, 

        modno = 22, pn.options = "myoptions"), data = subdata)

    summary(richardsR22.lis )

    richardsR22.nlme <- nlme(richardsR22.lis, random = pdDiag(Asym + Infl ~ 1) )

    summary(richardsR22.nlme)
## End(No test)

         

    # fit nls object using simple logistic model, with 

    # M, RAsym, Rk, Ri, and RM fixed to values in pnmodelparams

    ## No test: 
 
    
    modpar(logist.data$age, logist.data$mass ,force4par = TRUE, pn.options = "myoptions")

    change.pnparameters(M = 1, pn.options = "myoptions") #set to logistic (M =1) prior to fit

    richardsR32.nls <- nls(mass ~ SSposnegRichards(age, Asym = Asym, 

        K = K, Infl = Infl, modno = 32, pn.options = "myoptions"), data = logist.data)

    coef(richardsR32.nls)
## End(No test)

                

    # fit a two component model - enter your own data in place of "mydata"

    # this is not run for want of an appropriate dataset

    # if x of intersection unknown

    ## Not run: 
##D 
##D     modpar(mydata$x,mydata$y,twocomponent.x=TRUE, pn.options = "myoptions")
##D 
##D     # if x of intersection = 75
##D 
##D     modpar(mydata$x,mydata$y,twocomponent.x=75, pn.options = "myoptions") 
##D 
##D     richardsR1.nls <- nls(y~ SSposnegRichards(x, Asym = Asym, K = K,
##D 
##D       Infl = Infl, M = M, RAsym = RAsym, Rk = Rk, Ri = Ri, RM = RM, 
##D 
##D       modno = 1, pn.options = "myoptions")
##D 
##D       , data = mydata)
##D 
##D     coef(richardsR1.nls)
## End(Not run)

    


