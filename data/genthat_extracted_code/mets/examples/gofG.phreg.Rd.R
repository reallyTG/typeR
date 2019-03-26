library(mets)


### Name: gofG.phreg
### Title: Stratified baseline graphical GOF test for Cox covariates in PH
###   regression
### Aliases: gofG.phreg

### ** Examples

data(TRACE)

m1 <- phreg(Surv(time,status==9)~strata(vf)+chf+wmi,data=TRACE) 
m2 <- phreg(Surv(time,status==9)~vf+strata(chf)+wmi,data=TRACE) 
par(mfrow=c(2,2))

gofG.phreg(m1)
gofG.phreg(m2)

bplot(m1,log="y")
bplot(m2,log="y")



