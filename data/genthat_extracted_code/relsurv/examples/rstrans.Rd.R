library(relsurv)


### Name: rstrans
### Title: Fit Cox Proportional Hazards Model in Transformed Time
### Aliases: rstrans
### Keywords: survival

### ** Examples

data(slopop)
data(rdata)

#fit a Cox model using the transformed times
#note that the variable year is given in days since 01.01.1960 and that 
#age must be multiplied by 365.241 in order to be expressed in days.
fit <- rstrans(Surv(time,cens)~sex+as.factor(agegr),rmap=list(age=age*365.241,
        sex=sex,year=year),ratetable=slopop,data=rdata)


#check the goodness of fit
rs.br(fit)



