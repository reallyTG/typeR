library(relsurv)


### Name: rs.diff
### Title: Test Net Survival Curve Differences
### Aliases: rs.diff print.rsdiff
### Keywords: survival

### ** Examples

data(slopop)
data(rdata)
#calculate the relative survival curve
#note that the variable year is given in days since 01.01.1960 and that 
#age must be multiplied by 365.241 in order to be expressed in days.
rs.diff(Surv(time,cens)~sex,rmap=list(age=age*365.241),
		ratetable=slopop,data=rdata)



