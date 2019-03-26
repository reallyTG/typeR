library(FlexParamCurve)


### Name: extraF.nls
### Title: Compare Two nls Models Using Extra Sum-of-Squares F-Tests
### Aliases: extraF.nls

### ** Examples



#fit and compare two nested nls models (7 vs 8 parameter models)


   #create list for fixed parameters


   modpar(posneg.data$age, posneg.data$mass, pn.options = "myoptions") 


   richardsR1.nls <- nls(mass ~ SSposnegRichards(age, Asym = Asym, K = K,


   Infl = Infl, M = M, RAsym = RAsym, Rk = Rk, Ri = Ri, RM = RM, modno = 1, pn.options = myoptions)


                        , data = posneg.data)


   richardsR2.nls <- nls(mass ~ SSposnegRichards(age, Asym = Asym, K = K,


   Infl = Infl, M = M, RAsym = RAsym, Rk = Rk, Ri = Ri, modno = 2, pn.options = myoptions)


                        , data = posneg.data)


   extraF.nls(richardsR2.nls, richardsR1.nls)





