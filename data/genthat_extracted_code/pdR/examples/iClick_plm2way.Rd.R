library(pdR)


### Name: iClick.plm2way
### Title: iClick GUI for two-way panel data analysis, based on package
###   plm.
### Aliases: iClick.plm2way

### ** Examples

#unmark to run
#library("pdR")
#data("productivity")
#data2.plm=plm.data(productivity,index="state")
#head(data2.plm)
#formula2="log(y_gsp)~log(x1_hwy)+log(x2_water)"
#iClick.plm2way(Formula=formula2,data=data2.plm)


#data("crime")
#data3.plm= plm.data(crime, index = c("county"))
#head(data3.plm)
#formula3="log(crmrte)~log(prbarr)+log(polpc)+log(prbconv)
#+log(prbpris)+log(avgsen)+log(density)+log(wcon)+log(wtuc)
#+log(wtrd)+log(wfir)+log(wser) +log(wmfg)+log(wfed)
#+log(wsta)+log(wloc)+log(pctymle)+log(pctmin)+smsa+region"
#endo=c("log(prbarr)","log(polpc)")
#iv=c("log(taxpc)","log(mix)")
#iClick.plm1way(Formula=formula3,data=data3.plm,ENDOG=endo,IV=iv)




