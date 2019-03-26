library(wgeesel)


### Name: MLIC.gee
### Title: MLIC and MLICC for Weighted GEE
### Aliases: MLIC.gee
### Keywords: MLIC wgee

### ** Examples

data(imps)
fit1 <- wgee (Y ~ Drug+Sex+Time,data=imps,id=imps$ID,family="binomial",
             corstr="exchangeable",scale=NULL,mismodel= R ~ Drug+Time)

fit_f <- wgee (Y ~ Drug+Sex+Time+Time*Sex+Time*Drug,data=imps,id=imps$ID, family="binomial",
              corstr="exchangeable",scale=NULL,mismodel= R ~ Drug+Time)
###not run#####
##MLIC.gee(fit1,fit_f)




