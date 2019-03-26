library(textir)


### Name: congress109
### Title: Ideology in Political Speeches
### Aliases: congress109 congress109Ideology congress109Counts

### ** Examples

data(congress109)

## Bivariate sentiment factors (roll-call vote common scores)
covars <- data.frame(gop=congress109Ideology$party=="R",
					cscore=congress109Ideology$cs1)
covars$cscore <- covars$cscore - 
	tapply(covars$cscore,covars$gop,mean)[covars$gop+1]
rownames(covars) <- rownames(congress109Ideology)

## cl=NULL implies a serial run. 
## To use a parallel library fork cluster, 
## uncomment the relevant lines below. 
## Forking is unix only; use PSOCK for windows
cl <- NULL
# cl <- makeCluster(detectCores(), type="FORK")
## small nlambda for a fast example
fitCS <- dmr(cl, covars, congress109Counts, gamma=1, nlambda=10)
# stopCluster(cl)

## plot the fit
par(mfrow=c(1,2))
for(j in c("estate.tax","death.tax")){
	plot(fitCS[[j]], col=c("red","green"))
	mtext(j,line=2) }
legend("topright",bty="n",fill=c("red","green"),legend=names(covars))


## plot the IR sufficient reduction space
Z <- srproj(fitCS, congress109Counts)
par(mfrow=c(1,1))
plot(Z, pch=21, bg=c(4,3,2)[congress109Ideology$party], main="SR projections")
## two pols
Z[c(68,388),]



