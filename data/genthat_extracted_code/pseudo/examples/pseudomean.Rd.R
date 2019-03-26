library(pseudo)


### Name: pseudomean
### Title: Pseudo-observations for the restricted mean
### Aliases: pseudomean
### Keywords: survival

### ** Examples

library(KMsurv)
data(bmt)

#compute the pseudo-observations:
pseudo = pseudomean(time=bmt$t2, event=bmt$d3,tmax=2000)

#arrange the data
a <- cbind(bmt,pseudo = pseudo,id=1:nrow(bmt))

#fit a regression model for the mean time

library(geepack)
summary(fit <- geese(pseudo ~ z1 + as.factor(z8) + as.factor(group),
	data = a, id=id, jack = TRUE, family=gaussian, 
	corstr="independence", scale.fix=FALSE))


#rearrange the output
round(cbind(mean = fit$beta,SD = sqrt(diag(fit$vbeta.ajs)),
	Z = fit$beta/sqrt(diag(fit$vbeta.ajs)),	PVal =
	2-2*pnorm(abs(fit$beta/sqrt(diag(fit$vbeta.ajs))))),4)



