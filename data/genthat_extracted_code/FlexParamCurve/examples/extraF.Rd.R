library(FlexParamCurve)


### Name: extraF
### Title: Compare Two nlsList Models Using Extra Sum-of-Squares F-Tests
### Aliases: extraF

### ** Examples



   #compare two nested nlsList models (4 vs 8 parameter models)


   modpar(posneg.data$age, posneg.data$mass, pn.options = "myoptions")


   # (only first 4 group levels in data used for example's sake)


   subdata<-subset(posneg.data, as.numeric(row.names (posneg.data) ) < 53)


   richardsR2.lis <- nlsList(mass ~ SSposnegRichards(age, Asym = Asym, K = K,


     Infl = Infl, M = M, RAsym = RAsym, Rk = Rk, Ri = Ri,modno = 2, pn.options = "myoptions")


                        , data = subdata)


   richardsR12.lis <- nlsList(mass ~ SSposnegRichards(age, Asym = Asym, K = K,


     Infl = Infl, M = M, modno = 12, pn.options = "myoptions")


                        , data = subdata)


   extraF(richardsR12.lis, richardsR2.lis)





