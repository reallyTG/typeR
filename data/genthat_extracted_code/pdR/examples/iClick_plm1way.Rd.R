library(pdR)


### Name: iClick.plm1way
### Title: iClick GUI for one-way panel data analysis, based on package
###   plm.
### Aliases: iClick.plm1way

### ** Examples

#library("pdR")
##data("bank_income")
#data1.plm=plm.data(bank_income,index="ID");
#head(data1.plm,2)
#iClick.plm1way(dep=4,indep=c(5,7,8),data=data1.plm)


#data("productivity")
#data2.plm=plm.data(productivity,index="state")
#head(data2.plm,2)
#formula2="log(y_gsp)~log(x1_hwy)+log(x2_water)"
#iClick.plm2way(Formula=formula2,data=data2.plm)


#data("crime")
#data3.plm= plm.data(crime, index = c("county"));head(data3.plm,2)
#formula3="log(crmrte)~log(prbarr)+log(polpc)+log(prbconv)+log(prbpris)
#+log(avgsen)+log(density)+log(wcon)+log(wtuc)+log(wtrd)+log(wfir)
#+log(wser) +log(wmfg)+log(wfed)+log(wsta)+log(wloc)+log(pctymle)
#+log(pctmin)+smsa+region"
#endo=c("log(prbarr)","log(polpc)")
#iv=c("log(taxpc)","log(mix)")
#iClick.plm1way(Formula=formula3,data=data3.plm,ENDOG=endo,IV=iv)




