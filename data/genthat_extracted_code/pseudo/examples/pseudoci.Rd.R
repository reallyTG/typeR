library(pseudo)


### Name: pseudoci
### Title: Pseudo-observations for the cumulative incidence function
### Aliases: pseudoci
### Keywords: survival

### ** Examples

library(KMsurv)
data(bmt)

#calculate the pseudo-observations
cutoffs <- c(50,105,170,280,530)
bmt$icr <- bmt$d1 +  bmt$d3
pseudo <- pseudoci(time=bmt$t2,event=bmt$icr,tmax=cutoffs)

#rearrange the data into a long data set, use only pseudo-observations for relapse (icr=2)
b <- NULL
for(it in 1:length(pseudo$time)){
	b <- rbind(b,cbind(bmt,pseudo = pseudo$pseudo[[2]][,it],
	     tpseudo = pseudo$time[it],id=1:nrow(bmt)))
}
b <- b[order(b$id),]


# fit the model
library(geepack)
fit <- geese(pseudo ~ as.factor(tpseudo) + as.factor(group) + as.factor(z8) +
	z1 - 1, data =b, id=id, jack = TRUE, scale.fix=TRUE, family=gaussian,
	mean.link = "cloglog", corstr="independence")

#The results using the AJ variance estimate
cbind(mean = round(fit$beta,4), SD = round(sqrt(diag(fit$vbeta.ajs)),4),
	Z = round(fit$beta/sqrt(diag(fit$vbeta.ajs)),4),
	PVal = round(2-2*pnorm(abs(fit$beta/sqrt(diag(fit$vbeta.ajs)))),4))




