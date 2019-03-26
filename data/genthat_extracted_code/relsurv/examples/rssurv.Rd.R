library(relsurv)


### Name: rs.surv
### Title: Compute a Relative Survival Curve
### Aliases: rs.surv
### Keywords: survival

### ** Examples

data(slopop)
data(rdata)
#calculate the relative survival curve
#note that the variable year must be given in a date format and that 
#age must be multiplied by 365.241 in order to be expressed in days.
rs.surv(Surv(time,cens)~sex,rmap=list(age=age*365.241), ratetable=slopop,data=rdata)



