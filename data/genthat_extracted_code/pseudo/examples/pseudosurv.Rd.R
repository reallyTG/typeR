library(pseudo)


### Name: pseudosurv
### Title: Pseudo-observations for the Kaplan-Meier estimate
### Aliases: pseudosurv
### Keywords: survival

### ** Examples

library(KMsurv)
data(bmt)

#calculate the pseudo-observations
cutoffs <- c(50,105,170,280,530)
pseudo <- pseudosurv(time=bmt$t2,event=bmt$d3,tmax=cutoffs)


#rearrange the data into a long data set
b <- NULL
for(it in 1:length(pseudo$time)){
	b <- rbind(b,cbind(bmt,pseudo = pseudo$pseudo[,it],
	     tpseudo = pseudo$time[it],id=1:nrow(bmt)))
}
b <- b[order(b$id),]



#fit a Cox model using GEE
library(geepack)
summary(fit <- geese(pseudo~as.factor(tpseudo)+as.factor(group)+
        as.factor(z8)+z1,data=b,scale.fix=TRUE,family=gaussian,
        jack=TRUE, mean.link="cloglog",corstr="independence"))

#The results using the AJ variance estimate
round(cbind(mean = fit$beta,SD = sqrt(diag(fit$vbeta.ajs)),
	Z = fit$beta/sqrt(diag(fit$vbeta.ajs)),	PVal =
	2-2*pnorm(abs(fit$beta/sqrt(diag(fit$vbeta.ajs))))),4)



