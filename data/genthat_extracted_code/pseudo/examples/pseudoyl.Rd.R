library(pseudo)


### Name: pseudoyl
### Title: Pseudo-observations for the expected number of years lost
### Aliases: pseudoyl
### Keywords: survival

### ** Examples

library(KMsurv)
data(bmt)
bmt$icr <- bmt$d1 +  bmt$d3


#compute the pseudo-observations:
pseudo = pseudoyl(time=bmt$t2, event=bmt$icr,tmax=2000)

#arrange the data - use pseudo observations for cause 2
a <- cbind(bmt,pseudo = pseudo$pseudo[[2]],id=1:nrow(bmt))

#fit a regression model for cause 2

library(geepack)
summary(fit <- geese(pseudo ~ z1 + as.factor(z8) + as.factor(group),
	data = a, id=id, jack = TRUE, family=gaussian, 
	corstr="independence", scale.fix=FALSE))


#rearrange the output
round(cbind(mean = fit$beta,SD = sqrt(diag(fit$vbeta.ajs)),
	Z = fit$beta/sqrt(diag(fit$vbeta.ajs)),	PVal =
	2-2*pnorm(abs(fit$beta/sqrt(diag(fit$vbeta.ajs))))),4)



