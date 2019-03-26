library(geostatsp)


### Name: likfitLgm
### Title: Likelihood Based Parameter Estimation for Gaussian Random Fields
### Aliases: likfitLgm loglikLgm

### ** Examples

n=40
mydat = SpatialPointsDataFrame(
	cbind(runif(n), seq(0,1,len=n)), 
	data=data.frame(cov1 = rnorm(n), cov2 = rpois(n, 0.5))
	)

# simulate a random field
trueParam = c(variance=2^2, range=0.35, shape=2, nugget=0.5^2)
set.seed(1)

mydat@data= cbind(mydat@data , RFsimulate(model=trueParam,x=mydat)@data)

# add fixed effects
mydat$Y = -3 + 0.5*mydat$cov1 + 0.2*mydat$cov2 + 
	mydat$sim + rnorm(length(mydat), 0, sd=sqrt(trueParam["nugget"]))

spplot(mydat, "sim", col.regions=rainbow(10), main="U")
spplot(mydat, "Y", col.regions=rainbow(10), main="Y")


myres = likfitLgm(
	formula=Y ~ cov1 + cov2, 
	data=mydat, 
	param=c(range=0.1,nugget=0.1,shape=2), 
	paramToEstimate = c("range","nugget")
	)



myres$summary[,1:4]

if(interactive()  | Sys.info()['user'] =='patrick') {

# plot variograms of data, true model, and estimated model
myv = variog(mydat, formula=Y ~ cov1 + cov2,option="bin", max.dist=0.5)
# myv will be NULL if geoR isn't installed
if(!is.null(myv)){
plot(myv, ylim=c(0, max(c(1.2*sum(trueParam[c("variance", "nugget")]),myv$v))),
	main="variograms")
distseq = seq(0, 0.5, len=50)
lines(distseq, 
	sum(myres$param[c("variance", "nugget")]) - matern(distseq, param=myres$param),
	col='blue', lwd=3)
lines(distseq, 
	sum(trueParam[c("variance", "nugget")]) - matern(distseq, param=trueParam),
	col='red')	

legend("bottomright", fill=c("black","red","blue"), 
	legend=c("data","true","MLE"))
}

# without a nugget
myresNoN = likfitLgm(
	formula=Y ~ cov1 + cov2, 
	data=mydat, 
	param=c(range=0.1,nugget=0,shape=1), 
	paramToEstimate = c("range")
	)

myresNoN$summary[,1:4]


# plot variograms of data, true model, and estimated model
myv = variog(mydat, formula=Y ~ cov1 + cov2,option="bin", max.dist=0.5)

if(!is.null(myv)){
plot(myv, ylim=c(0, max(c(1.2*sum(trueParam[c("variance", "nugget")]),myv$v))),
	main="variograms")
	
distseq = seq(0, 0.5, len=50)
lines(distseq, 
	sum(myres$param[c("variance", "nugget")]) - matern(distseq, param=myres$param),
	col='blue', lwd=3)
lines(distseq, 
	sum(trueParam[c("variance", "nugget")]) - matern(distseq, param=trueParam),
	col='red')	

lines(distseq, 
	sum(myresNoN$param[c("variance", "nugget")]) - 
			matern(distseq, param=myresNoN$param),
	col='green', lty=2, lwd=3)	
legend("bottomright", fill=c("black","red","blue","green"), 
	legend=c("data","true","MLE","no N"))
}


# calculate likelihood
temp=loglikLgm(param=myres$param, 
		data=mydat, 
		formula = Y ~ cov1 + cov2,
		reml=FALSE, minustwotimes=FALSE)



# an anisotropic example


trueParamAniso = param=c(variance=2^2, range=0.2, shape=2,
	 nugget=0,anisoRatio=4,anisoAngleDegrees=10, nugget=0)

mydat$U = geostatsp::RFsimulate(trueParamAniso,mydat)$sim

mydat$Y = -3 + 0.5*mydat$cov1 + 0.2*mydat$cov2 + 
	mydat$U + rnorm(length(mydat), 0, sd=sqrt(trueParamAniso["nugget"]))



par(mfrow=c(1,2))
oldmar = par("mar")
par(mar=rep(0.1, 4))

plot(mydat, col=as.character(cut(mydat$U, breaks=50, labels=heat.colors(50))),
	pch=16, main="aniso")
 
plot(mydat, col=as.character(cut(mydat$Y, breaks=50, labels=heat.colors(50))),
	pch=16,main="iso")
par(mar=oldmar)


myres = likfitLgm( 
	formula=Y ~ cov1 + cov2, 
	data=mydat,
	param=c(range=0.1,nugget=0,shape=2, anisoAngleDegrees=0, anisoRatio=2), 
	paramToEstimate = c("range","nugget","anisoRatio","anisoAngleDegrees") 
	)

myres$summary

par(mfrow=c(1,2))

myraster = raster(nrows=30,ncols=30,xmn=0,xmx=1,ymn=0,ymx=1)
covEst = matern(myraster, y=c(0.5, 0.5), par=myres$param)
covTrue = matern(myraster, y=c(0.5, 0.5), par=trueParamAniso)

plot(covEst, main="estimate")
plot(covTrue, main="true")

par(mfrow=c(1,1))
}



