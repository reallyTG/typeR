library(hyper.fit)


### Name: hyper.fit
### Title: Top level function that attempts to fit a hyperplane to provided
###   data.
### Aliases: hyper.fit
### Keywords: fit hyper linear plane regression

### ** Examples

#### A very simple 2D example ####

#Make the simple data:

simpledata=cbind(x=1:10,y=c(12.2, 14.2, 15.9, 18.0, 20.1, 22.1, 23.9, 26.0, 27.9, 30.1))
simpfit=hyper.fit(simpledata)
summary(simpfit)
plot(simpfit)

#Increase the scatter:

simpledata2=cbind(x=1:10,y=c(11.6, 13.7, 15.5, 18.2, 21.2, 21.5, 23.6, 25.6, 27.9, 30.1))
simpfit2=hyper.fit(simpledata2)
summary(simpfit2)
plot(simpfit2)

#Assuming the error in each y data point is the same sy=0.5, we no longer need any
#component of intrinsic scatter to explain the data:

simpledata2err=cbind(sx=0, sy=rep(0.5, length(simpledata2[, 1])))
simpfit2werr=hyper.fit(simpledata2, vars=simpledata2err)
summary(simpfit2werr)
plot(simpfit2werr)

#We can fit for 6 different combinations of coordinate system:

print(hyper.fit(simpledata, coord.type='theta', scat.type='orth')$parm)
print(hyper.fit(simpledata, coord.type='alpha', scat.type='orth')$parm)
print(hyper.fit(simpledata, coord.type='normvec', scat.type='orth')$parm)
print(hyper.fit(simpledata, coord.type='theta', scat.type='vert.axis')$parm)
print(hyper.fit(simpledata, coord.type='alpha', scat.type='vert.axis')$parm)
print(hyper.fit(simpledata, coord.type='normvec', scat.type='vert.axis')$parm)

#These all describe the same hyperplane (or line in this case). We can convert between
#systems by using the hyper.convert utility function:

fit4normvert=hyper.fit(simpledata, coord.type='normvec', scat.type='vert.axis')$parm
hyper.convert(fit4normvert, in.coord.type='normvec', out.coord.type='theta',
in.scat.type='vert.axis', out.scat.type='orth')$parm

#### Simple Example in hyper.fit paper ####

#Fit with no error:

xval = c(-1.22, -0.78, 0.44, 1.01, 1.22)
yval = c(-0.15, 0.49, 1.17, 0.72, 1.22)

fitnoerror=hyper.fit(cbind(xval, yval))
plot(fitnoerror)

#Fit with independent x and y error:

xerr = c(0.12, 0.14, 0.20, 0.07, 0.06)
yerr = c(0.13, 0.03, 0.07, 0.11, 0.08)
fitwitherror=hyper.fit(cbind(xval, yval), vars=cbind(xerr, yerr)^2)
plot(fitwitherror)

#Fit with correlated x and y error:

xycor = c(0.90, -0.40, -0.25, 0.00, -0.20)
fitwitherrorandcor=hyper.fit(cbind(xval, yval), covarray=makecovarray2d(xerr, yerr, xycor))
plot(fitwitherrorandcor)

#### A 2D example with fitting a line ####

#Setup the initial data:

## Not run: 
##D 
##D set.seed(650)
##D sampN=200
##D initscat=3
##D randatax=runif(sampN, -100, 100)
##D randatay=rnorm(sampN, sd=initscat)
##D sx=runif(sampN, 0, 10); sy=runif(sampN, 0, 10)
##D 
##D mockvararray=makecovarray2d(sx, sy, corxy=0)
##D 
##D errxy={}
##D for(i in 1:sampN){
##D   rancovmat=ranrotcovmat2d(mockvararray[,,i])
##D   errxy=rbind(errxy, mvrnorm(1, mu=c(0, 0), Sigma=rancovmat))
##D   mockvararray[,,i]=rancovmat
##D   }
##D randatax=randatax+errxy[,1]
##D randatay=randatay+errxy[,2]
##D 
##D #Rotate the data to an arbitrary angle theta:
##D 
##D ang=30
##D mock=rotdata2d(randatax, randatay, theta=ang)
##D xerrang={}; yerrang={}; corxyang={}
##D for(i in 1:sampN){
##D   covmatrot=rotcovmat(mockvararray[,,i], theta=ang)
##D   xerrang=c(xerrang, sqrt(covmatrot[1,1])); yerrang=c(yerrang, sqrt(covmatrot[2,2]))
##D   corxyang=c(corxyang, covmatrot[1,2]/(xerrang[i]*yerrang[i]))
##D }
##D corxyang[xerrang==0 & yerrang==0]=0
##D mock=data.frame(x=mock[,1], y=mock[,2], sx=xerrang, sy=yerrang, corxy=corxyang)
##D 
##D #Do the fit:
##D 
##D X=cbind(mock$x, mock$y)
##D covarray=makecovarray2d(mock$sx, mock$sy, mock$corxy)
##D fitline=hyper.fit(X=X, covarray=covarray, coord.type='theta')
##D summary(fitline)
##D plot(fitline, trans=0.2, asp=1)
##D 
##D #We can add increasingly strenuous priors on theta (which becomes much like fixing theta):
##D 
##D fitline_p1=hyper.fit(X=X, covarray=covarray, coord.type='theta',
##D                   prior=function(parm){dnorm(parm[1],mean=40,sd=1,log=TRUE)})
##D plot(fitline_p1, trans=0.2, asp=1)
##D 
##D fitline_p2=hyper.fit(X=X, covarray=covarray, coord.type='theta',
##D                   prior=function(parm){dnorm(parm[1],mean=40,sd=0.01,log=TRUE)})
##D plot(fitline_p2, trans=0.2, asp=1)
##D 
##D #We can test to see if the errors are compatable with the intrinsic scatter:
##D 
##D fitlineerrscale=hyper.fit(X=X, covarray=covarray, coord.type='theta', doerrorscale=TRUE)
##D summary(fitlineerrscale)
##D plot(fitline, parm.errorscale=fitlineerrscale$parm['errorscale'], trans=0.2, asp=1)
##D 
##D #Within errors the errorscale parameter is 1, i.e. the errors are realistic, which we know
##D #they should be a priori since we made them ourselves.
##D 
## End(Not run)

#### A 2D example with exponential sampling & fitting a line ####

#Setup the initial data:

## Not run: 
##D 
##D set.seed(650)
##D 
##D #The effect of an exponential density function along y is to offset the Gaussian mean by
##D #0.5 times the factor 'a' in exp(a*x), i.e.:
##D 
##D normfac=dnorm(0,sd=1.1)/(dnorm(10*1.1^2,sd=1.1)*exp(10*10*1.1^2))
##D magplot(seq(5,15,by=0.01), normfac*dnorm(seq(5,15, by=0.01), sd=1.1)*exp(10*seq(5,15,
##D by=0.01)), type='l')
##D abline(v=10*1.1^2,lty=2)
##D 
##D #The above will not be correctly normalised to form a true PDF, but the shift in the mean
##D #is clear, and it doesn't alter the standard deviation at all:
##D 
##D points(seq(5,15,by=0.1), dnorm(seq(5,15, by=0.1), mean=10*1.1^2, sd=1.1),col='red')
##D 
##D #Applying the same principal to our random data we apply the offset due to our exponential
##D #generative slope in y:
##D 
##D set.seed(650)
##D 
##D sampN=200
##D vert.scat=10
##D sampexp=0.1
##D ang=30
##D randatax=runif(200,-100,100)
##D randatay=randatax*tan(ang*pi/180)+rnorm(sampN, mean=sampexp*vert.scat^2, sd=vert.scat)
##D sx=runif(sampN, 0, 10); sy=runif(sampN, 0, 10)
##D 
##D mockvararray=makecovarray2d(sx, sy, corxy=0)
##D 
##D errxy={}
##D for(i in 1:sampN){
##D   rancovmat=ranrotcovmat2d(mockvararray[,,i])
##D   errxy=rbind(errxy, mvrnorm(1, mu=c(0, sampexp*sy[i]^2), Sigma=rancovmat))
##D   mockvararray[,,i]=rancovmat
##D   }
##D randatax=randatax+errxy[,1]
##D randatay=randatay+errxy[,2]
##D sx=sqrt(mockvararray[1,1,]); sy=sqrt(mockvararray[2,2,]); corxy=mockvararray[1,2,]/(sx*sy)
##D mock=data.frame(x=randatax, y=randatay, sx=sx, sy=sy, corxy=corxy)
##D 
##D #Do the fit. Notice that the second element of k.vec has the positive sign, i.e. we are moving
##D #data that has been shifted positively by the positive exponential slope in y back to where it
##D #would exist without the slope (i.e. if it had an equal chance of being scattered in both
##D #directions, rather than being preferentially offset in the direction away from denser data).
##D #This dense -> less-dense shift i s known as Eddington bias in astronomy, and is common in all
##D #power-law distributions that have intrinsic scatter (e.g. Schechter LF and dark matter HMF).
##D 
##D X=cbind(mock$x, mock$y)
##D covarray=makecovarray2d(mock$sx, mock$sy, mock$corxy)
##D fitlineexp=hyper.fit(X=X, covarray=covarray, coord.type='theta', k.vec=c(0,sampexp),
##D scat.type='vert.axis')
##D summary(fitlineexp)
##D plot(fitlineexp, k.vec=c(0,sampexp))
##D 
##D #If we ignore the k.vec when calculating the plotting sigma values you can see it has
##D #a significant effect:
##D 
##D plot(fitlineexp, trans=0.2, asp=1)
##D 
##D #Compare this to not including the known exponential slope:
##D 
##D fitlinenoexp=hyper.fit(X=X, covarray=covarray, coord.type='theta', k.vec=c(0,0),
##D scat.type='vert.axis')
##D summary(fitlinenoexp)
##D plot(fitlinenoexp, trans=0.2, asp=1)
##D 
## End(Not run)

#The theta and intrinsic scatter are similar, but the offset is shifted significantly
#away from zero.

#### A 3D example with fitting a plane ####

#Setup the initial data:

## Not run: 
##D 
##D set.seed(650)
##D sampN=200
##D initscat=3
##D randatax=runif(sampN, -100, 100)
##D randatay=runif(sampN, -100, 100)
##D randataz=rnorm(sampN, sd=initscat)
##D sx=runif(sampN, 0, 5); sy=runif(sampN, 0, 5); sz=runif(sampN, 0, 5)
##D 
##D mockvararray=makecovarray3d(sx, sy, sz, corxy=0, corxz=0, coryz=0)
##D 
##D errxyz={}
##D for(i in 1:sampN){
##D   rancovmat=ranrotcovmat3d(mockvararray[,,i])
##D   errxyz=rbind(errxyz,mvrnorm(1, mu=c(0, 0, 0), Sigma=rancovmat))
##D   mockvararray[,,i]=rancovmat
##D   }
##D randatax=randatax+errxyz[,1]
##D randatay=randatay+errxyz[,2]
##D randataz=randataz+errxyz[,3]
##D sx=sqrt(mockvararray[1,1,]); sy=sqrt(mockvararray[2,2,]); sz=sqrt(mockvararray[3,3,])
##D corxy=mockvararray[1,2,]/(sx*sy); corxz=mockvararray[1,3,]/(sx*sz)
##D coryz=mockvararray[2,3,]/(sy*sz)
##D 
##D #Rotate the data to an arbitrary angle theta/phi:
##D 
##D desiredxtozang=10
##D desiredytozang=40
##D ang=c(desiredxtozang*cos(desiredytozang*pi/180), desiredytozang)
##D newxyz=rotdata3d(randatax, randatay, randataz, theta=ang[1], dim='y')
##D newxyz=rotdata3d(newxyz[,1], newxyz[,2], newxyz[,3], theta=ang[2], dim='x')
##D mockplane=data.frame(x=newxyz[,1], y=newxyz[,2], z=newxyz[,3])
##D 
##D xerrang={};yerrang={};zerrang={}
##D corxyang={};corxzang={};coryzang={}
##D for(i in 1:sampN){
##D   newcovmatrot=rotcovmat(makecovmat3d(sx=sx[i], sy=sy[i], sz=sz[i], corxy=corxy[i],
##D   corxz=corxz[i], coryz=coryz[i]), theta=ang[1], dim='y')
##D   newcovmatrot=rotcovmat(newcovmatrot, theta=ang[2], dim='x')
##D   xerrang=c(xerrang, sqrt(newcovmatrot[1,1]))
##D   yerrang=c(yerrang, sqrt(newcovmatrot[2,2]))
##D   zerrang=c(zerrang, sqrt(newcovmatrot[3,3]))
##D   corxyang=c(corxyang, newcovmatrot[1,2]/(xerrang[i]*yerrang[i]))
##D   corxzang=c(corxzang, newcovmatrot[1,3]/(xerrang[i]*zerrang[i]))
##D   coryzang=c(coryzang, newcovmatrot[2,3]/(yerrang[i]*zerrang[i]))
##D }
##D corxyang[xerrang==0 & yerrang==0]=0
##D corxzang[xerrang==0 & zerrang==0]=0
##D coryzang[yerrang==0 & zerrang==0]=0
##D mockplane=data.frame(x=mockplane$x, y=mockplane$y, z=mockplane$z, sx=xerrang, sy=yerrang,
##D sz=zerrang, corxy=corxyang, corxz=corxzang, coryz=coryzang)
##D 
##D X=cbind(mockplane$x, mockplane$y, mockplane$z)
##D covarray=makecovarray3d(mockplane$sx, mockplane$sy, mockplane$sz, mockplane$corxy,
##D mockplane$corxz, mockplane$coryz)
##D fitplane=hyper.fit(X=X, covarray=covarray, coord.type='theta', scat.type='orth')
##D summary(fitplane)
##D plot(fitplane)
##D 
## End(Not run)

#### Example using the data from Hogg 2010 ####

#Example using the data from Hogg 2010: http://arxiv.org/pdf/1008.4686v1.pdf

#Load data:

## Not run: 
##D 
##D data(hogg)
##D 
##D #Fit:
##D 
##D fithogg=hyper.fit(X=cbind(hogg$x, hogg$y), covarray=makecovarray2d(hogg$x_err, hogg$y_err,
##D hogg$corxy), coord.type='theta', scat.type='orth')
##D summary(fithogg)
##D plot(fithogg, trans=0.2)
##D 
##D #We now do exercise 17 of Hogg 2010 using trimmed data:
##D 
##D hoggtrim=hogg[-3,]
##D fithoggtrim=hyper.fit(X=cbind(hoggtrim$x, hoggtrim$y), covarray=makecovarray2d(hoggtrim$x_err,
##D hoggtrim$y_err, hoggtrim$corxy), coord.type='theta', scat.type='orth', algo.func='LA')
##D summary(fithoggtrim)
##D plot(fithoggtrim, trans=0.2)
##D 
##D #We can get more info from looking at the Summary1 output of the LaplaceApproximation:
##D 
##D print(fithoggtrim$fit$Summary1)
##D 
##D #MCMC (exercise 18):
##D 
##D fithoggtrimMCMC=hyper.fit(X=cbind(hoggtrim$x, hoggtrim$y), covarray=
##D makecovarray2d(hoggtrim$x_err, hoggtrim$y_err, hoggtrim$corxy), coord.type='theta',
##D scat.type='orth', algo.func='LD', algo.method='CHARM', Specs=list(alpha.star = 0.44))
##D summary(fithoggtrimMCMC)
##D 
##D #We can get additional info from looking at the Summary1 output of the LaplacesDemon:
##D 
##D print(fithoggtrimMCMC$fit$Summary2)
##D 
##D magplot(density(fithoggtrimMCMC$fit$Posterior2[,3]), xlab='Intrinsic Scatter',
##D ylab='Probability Density')
##D abline(v=quantile(fithoggtrimMCMC$fit$Posterior2[,3], c(0.95,0.99)), lty=2)
##D 
## End(Not run)

#### Example using 'real' data with intrinsic scatter ####

## Not run: 
##D 
##D data(intrin)
##D 
##D fitintrin=hyper.fit(X=cbind(intrin$x, intrin$y), vars=cbind(intrin$x_err,
##D intrin$y_err)^2, coord.type='theta', scat.type='orth', algo.func='LA')
##D summary(fitintrin)
##D plot(fitintrin, trans=0.1, pch='.', asp=1)
##D 
##D fitintrincor=hyper.fit(X=cbind(intrin$x, intrin$y), covarray=makecovarray2d(intrin$x_err,
##D intrin$y_err, intrin$corxy), coord.type='theta', scat.type='orth', algo.func='LA')
##D summary(fitintrincor)
##D plot(fitintrincor, trans=0.1, pch='.', asp=1)
##D 
## End(Not run)

#### Example using flaring trumpet data ####

## Not run: 
##D 
##D data(trumpet)
##D fittrumpet=hyper.fit(X=cbind(trumpet$x, trumpet$y), covarray=makecovarray2d(trumpet$x_err,
##D trumpet$y_err, trumpet$corxy), coord.type='normvec', algo.func='LA')
##D summary(fittrumpet)
##D plot(fittrumpet, trans=0.1, pch='.', asp=1)
##D 
##D #The best fit solution has a scat.orth very close to 0, so it is worth considering if the
##D #data should truly have 0 intrinsic scatter.
##D 
## End(Not run)

## Not run: 
##D 
##D #To find the likelihood of zero intrinsic scatter we will need to run LaplacesDemon. The
##D #following will take a couple of minutes to run:
##D 
##D set.seed(650)
##D fittrumpetMCMC=hyper.fit(X=cbind(trumpet$x, trumpet$y), covarray=makecovarray2d(trumpet$x_err,
##D trumpet$y_err, trumpet$corxy), coord.type='normvec', algo.func='LD', itermax=1e5)
##D 
##D #Assuming the user has specified the same initial seed we should find that the data
##D #has exactly zero intrinsic scatter with ~47% likelihood:
##D 
##D print(fittrumpetMCMC$zeroscatprob)
##D 
##D #We can also make an assessment of whether the data has even less scatter than expected
##D #given the expected errors:
##D 
##D set.seed(650)
##D fittrumpetMCMCerrscale=hyper.fit(X=cbind(trumpet$x, trumpet$y), covarray=makecovarray2d(
##D trumpet$x_err, trumpet$y_err, trumpet$corxy), itermax=1e5, coord.type='normvec', algo.func='LD',
##D algo.method='CHARM', Specs=list(alpha.star = 0.44), doerrorscale=TRUE)
##D 
##D #Assuming the user has specified the same initial seed we should find that the data
##D #has exactly zero intrinsic scatter with ~69% likelihood:
##D 
##D print(fittrumpetMCMCerrscale$zeroscatprob)
##D 
## End(Not run)

#### Example using 6dFGS Fundamental Plane data ####

## Not run: 
##D 
##D data(FP6dFGS)
##D 
##D #First we try the fit without using any weights:
##D 
##D fitFP6dFGS=hyper.fit(FP6dFGS[,c('logIe_J', 'logsigma', 'logRe_J')], 
##D vars=FP6dFGS[,c('logIe_J_err', 'logsigma_err', 'logRe_J_err')]^2, coord.type='alpha',
##D scat.type='vert.axis')
##D summary(fitFP6dFGS)
##D plot(fitFP6dFGS, doellipse=FALSE, alpha=0.5)
##D 
## End(Not run)

#Next we add the censoring weights provided by C. Magoulas:

## Not run: 
##D 
##D fitFP6dFGSw=hyper.fit(FP6dFGS[,c('logIe_J', 'logsigma', 'logRe_J')],
##D vars=FP6dFGS[,c('logIe_J_err', 'logsigma_err', 'logRe_J_err')]^2, weights=FP6dFGS[,'weights'],
##D coord.type='alpha', scat.type='vert.axis')
##D summary(fitFP6dFGSw)
##D plot(fitFP6dFGSw, doellipse=FALSE, alpha=0.5)
##D 
##D #It is interesting to note the scatter orthogonal to the plane for the fundmental plane:
##D 
##D print(hyper.convert(coord=fitFP6dFGSw$parm[1:2], beta=fitFP6dFGSw$parm[3],
##D scat=fitFP6dFGSw$parm[4], in.scat.type='vert.axis', out.scat.type='orth',
##D in.coord.type='alpha'))
##D 
## End(Not run)

#### Example using GAMA mass-size relation data ####

## Not run: 
##D 
##D data(GAMAsmVsize)
##D fitGAMAsmVsize=hyper.fit(GAMAsmVsize[,c('logmstar', 'rekpc')],
##D vars=GAMAsmVsize[,c('logmstar_err', 'rekpc_err')]^2, weights=GAMAsmVsize[,'weights'],
##D coord.type='alpha', scat.type='vert.axis')
##D summary(fitGAMAsmVsize)
##D #We turn the ellipse plotting off to speed things up:
##D plot(fitGAMAsmVsize, doellipse=FALSE, unlog='x')
##D 
##D #This is obviously a poor fit since the y data has a non-linear dependence on x. Let's try
##D #using the logged y-axis and converted errors:
##D 
##D fitGAMAsmVsizelogre=hyper.fit(GAMAsmVsize[,c('logmstar', 'logrekpc')],
##D vars=GAMAsmVsize[,c('logmstar_err', 'logrekpc_err')]^2, weights=GAMAsmVsize[,'weights'],
##D coord.type='alpha', scat.type='vert.axis')
##D summary(fitGAMAsmVsizelogre)
##D #We turn the ellipse plotting off to speed things up:
##D plot(fitGAMAsmVsizelogre, doellipse=FALSE, unlog='xy')
##D 
##D #We can compare to a fit with no errors used:
##D 
##D fitGAMAsmVsizelogrenoerr=hyper.fit(GAMAsmVsize[,c('logmstar', 'logrekpc')],
##D weights=GAMAsmVsize[,'weights'], coord.type='alpha', scat.type='vert.axis')
##D summary(fitGAMAsmVsizelogrenoerr)
##D #We turn the ellipse plotting off to speed things up:
##D plot(fitGAMAsmVsizelogrenoerr, doellipse=FALSE, unlog='xy')
##D 
## End(Not run)

### Example using Tully-Fisher relation data ###

## Not run: 
##D 
##D data(TFR)
##D TFRfit=hyper.fit(X=TFR[,c('logv','M_K')],vars=TFR[,c('logv_err','M_K_err')]^2)
##D plot(TFRfit, xlim=c(1.7,2.5), ylim=c(-19,-26))
##D 
## End(Not run)

### Mase-Angular Momentum-Bulge/Total ###

## Not run: 
##D 
##D data(MJB)
##D MJBfit=hyper.fit(X=MJB[,c('logM','logj','B.T')], covarray=makecovarray3d(MJB$logM_err,
##D MJB$logj_err, MJB$B.T_err, MJB$corMJ, 0, 0))
##D plot(MJBfit)
##D 
## End(Not run)




