library(relsurv)


### Name: rsmul
### Title: Fit Andersen et al Multiplicative Regression Model for Relative
###   Survival
### Aliases: rsmul
### Keywords: survival

### ** Examples

data(slopop)
data(rdata)
#fit a multiplicative model
#note that the variable year is given in days since 01.01.1960 and that 
#age must be multiplied by 365.241 in order to be expressed in days.
fit <- rsmul(Surv(time,cens)~sex+as.factor(agegr),rmap=list(age=age*365.241),
            ratetable=slopop,data=rdata)


#check the goodness of fit
rs.br(fit)




