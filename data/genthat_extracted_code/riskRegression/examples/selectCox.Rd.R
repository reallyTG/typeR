library(riskRegression)


### Name: selectCox
### Title: Backward variable selection in the Cox regression model
### Aliases: selectCox
### Keywords: survival

### ** Examples


library(pec)
data(GBSG2)
library(survival)
f <- selectCox(Surv(time,cens)~horTh+age+menostat+tsize+tgrade+pnodes+progrec+estrec ,
	       data=GBSG2)




