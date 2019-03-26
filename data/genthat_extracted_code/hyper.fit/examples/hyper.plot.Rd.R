library(hyper.fit)


### Name: hyper.plot
### Title: A 2d and 3d likelihood diagnostic plot for optimal line fitting
### Aliases: hyper.plot hyper.plot2d hyper.plot3d plot.hyper.fit
### Keywords: fit plot hyper linear plane regression

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

set.seed(650)
sampN=200
initscat=3
randatax=runif(sampN, -100, 100)
randatay=rnorm(sampN, sd=initscat)
sx=runif(sampN, 0, 10); sy=runif(sampN, 0, 10)

mockvararray=makecovarray2d(sx, sy, corxy=0)

errxy={}
for(i in 1:sampN){
  rancovmat=ranrotcovmat2d(mockvararray[,,i])
  errxy=rbind(errxy, mvrnorm(1, mu=c(0, 0), Sigma=rancovmat))
  mockvararray[,,i]=rancovmat
  }
randatax=randatax+errxy[,1]
randatay=randatay+errxy[,2]

#Rotate the data to an arbitrary angle theta:

ang=30
mock=rotdata2d(randatax, randatay, theta=ang)
xerrang={}; yerrang={}; corxyang={}
for(i in 1:sampN){
  covmatrot=rotcovmat(mockvararray[,,i], theta=ang)
  xerrang=c(xerrang, sqrt(covmatrot[1,1])); yerrang=c(yerrang, sqrt(covmatrot[2,2]))
  corxyang=c(corxyang, covmatrot[1,2]/(xerrang[i]*yerrang[i]))
}
corxyang[xerrang==0 & yerrang==0]=0
mock=data.frame(x=mock[,1], y=mock[,2], sx=xerrang, sy=yerrang, corxy=corxyang)

#Do the fit:

X=cbind(mock$x, mock$y)
covarray=makecovarray2d(mock$sx, mock$sy, mock$corxy)
fitline=hyper.fit(X=X, covarray=covarray, coord.type='theta')
hyper.plot2d(X=X, covarray=covarray, fitobj=fitline, trans=0.2, asp=1)
#Or even easier:
plot(fitline, trans=0.2, asp=1)

#### A 3D example with fitting a plane ####

## Not run: 
##D 
##D #Setup the initial data:
##D 
##D set.seed(650)
##D sampN=200
##D initscat=3
##D randatax=runif(sampN, -100, 100)
##D randatay=runif(sampN, -100, 100)
##D randataz=rnorm(sampN, sd=initscat)
##D sx=runif(sampN, 0, 5); sy=runif(sampN,0,5); sz=runif(sampN, 0, 5)
##D 
##D mockvararray=makecovarray3d(sx, sy, sz, corxy=0, corxz=0, coryz=0)
##D 
##D errxyz={}
##D for(i in 1:sampN){
##D   rancovmat=ranrotcovmat3d(mockvararray[,,i])
##D   errxyz=rbind(errxyz, mvrnorm(1, mu=c(0, 0, 0), Sigma=rancovmat))
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
##D desiredxtozang=10
##D desiredytozang=40
##D ang=c(desiredxtozang*cos(desiredytozang*pi/180), desiredytozang)
##D newxyz=rotdata3d(randatax, randatay, randataz, theta=ang[1], dim='y')
##D newxyz=rotdata3d(newxyz[,1], newxyz[,2], newxyz[,3], theta=ang[2], dim='x')
##D mockplane=data.frame(x=newxyz[,1], y=newxyz[,2], z=newxyz[,3])
##D 
##D xerrang={}; yerrang={}; zerrang={}
##D corxyang={}; corxzang={}; coryzang={}
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
##D hyper.plot3d(X=X, covarray=covarray, fitobj=fitplane)
##D #Or even easier:
##D plot(fitplane)
## End(Not run)

#### Example using the data from Hogg 2010 ####

#Example using the data from Hogg 2010: http://arxiv.org/pdf/1008.4686v1.pdf

#Full data

## Not run: 
##D 
##D data(hogg)
##D fithogg=hyper.fit(X=cbind(hogg$x, hogg$y), covarray=makecovarray2d(hogg$x_err, hogg$y_err,
##D hogg$corxy), coord.type='theta', scat.type='orth')
##D hyper.plot2d(X=cbind(hogg$x, hogg$y), covarray=makecovarray2d(hogg$x_err, hogg$y_err,
##D hogg$corxy), fitobj=fithogg, trans=0.2, xlim=c(0, 300), ylim=c(0, 700))
##D #Or even easier:
##D plot(fithogg, trans=0.2)
##D 
##D #We now do exercise 17 of Hogg 2010 using trimmed data, where we remove the high tension
##D #data point 3 (which we can see as the reddest point in the above plot:
##D 
##D data(hogg)
##D hoggtrim=hogg[-3,]
##D fithoggtrim=hyper.fit(X=cbind(hoggtrim$x, hoggtrim$y), covarray=makecovarray2d(hoggtrim$x_err,
##D hoggtrim$y_err, hoggtrim$corxy), coord.type='theta', scat.type='orth', algo.func='LA')
##D hyper.plot2d(X=cbind(hoggtrim$x, hoggtrim$y), covarray=makecovarray2d(hoggtrim$x_err,
##D hoggtrim$y_err, hoggtrim$corxy), fitobj=fithoggtrim, trans=0.2, xlim=c(0, 300), ylim=c(0, 700))
##D #Or even easier:
##D plot(fithoggtrim, trans=0.2)
##D 
##D #We can compare this against the previous fit with:
##D hyper.plot2d(cbind(hoggtrim$x, hoggtrim$y), covarray=makecovarray2d(hoggtrim$x_err,
##D hoggtrim$y_err, hoggtrim$corxy), fitobj=fithogg, trans=0.2, xlim=c(0, 300), ylim=c(0, 700))
##D 
## End(Not run)

#### Example using 'real' data with intrinsic scatter ####

## Not run: 
##D 
##D data(intrin)
##D fitintrin=hyper.fit(X=cbind(intrin$x, intrin$y), vars=cbind(intrin$x_err,
##D intrin$y_err)^2, coord.type='theta', scat.type='orth', algo.func='LA')
##D hyper.plot2d(cbind(intrin$x, intrin$y), covarray=makecovarray2d(intrin$x_err,
##D intrin$y_err, intrin$corxy), fitobj=fitintrin, trans=0.1, pch='.', asp=1)
##D #Or even easier:
##D plot(fitintrin, trans=0.1, pch='.', asp=1)
##D 
## End(Not run)

#### Example using flaring trumpet data ####

## Not run: 
##D 
##D data(trumpet)
##D fittrumpet=hyper.fit(X=cbind(trumpet$x, trumpet$y), covarray=makecovarray2d(trumpet$x_err,
##D trumpet$y_err, trumpet$corxy), coord.type='theta', algo.func='LA')
##D hyper.plot2d(cbind(trumpet$x, trumpet$y), covarray=makecovarray2d(trumpet$x_err,
##D trumpet$y_err, trumpet$corxy), fitobj=fittrumpet, trans=0.1, pch='.', asp=1)
##D #Or even easier:
##D plot(fittrumpet, trans=0.1, pch='.', asp=1)
##D #If you look at the ?hyper.fit example we find that zero intrinsic scatter is actually
##D #preferred, but we don't see this in the above plot.
##D 
## End(Not run)

#### Example using 6dFGS Fundamental Plane data ####

## Not run: 
##D 
##D data(FP6dFGS)
##D fitFP6dFGSw=hyper.fit(FP6dFGS[,c('logIe_J', 'logsigma', 'logRe_J')],
##D vars=FP6dFGS[,c('logIe_J_err', 'logsigma_err', 'logRe_J_err')]^2, weights=FP6dFGS[,'weights'],
##D coord.type='alpha', scat.type='vert.axis')
##D #We turn the ellipse plotting off to speed things up:
##D plot(fitFP6dFGSw, doellipse=FALSE, alpha=0.5)
##D 
## End(Not run)

#### Example using GAMA mass-size relation data ####

## Not run: 
##D 
##D data(GAMAsmVsize)
##D fitGAMAsmVsize=hyper.fit(GAMAsmVsize[,c('logmstar', 'rekpc')],
##D vars=GAMAsmVsize[,c('logmstar_err', 'rekpc_err')]^2, weights=GAMAsmVsize[,'weights'],
##D coord.type='alpha', scat.type='vert.axis')
##D #We turn the ellipse plotting off to speed things up:
##D plot(fitGAMAsmVsize, doellipse=FALSE, unlog='x')
##D 
##D #This is obviously a poor fit since the y data has a non-linear dependence on x. Let's try
##D #using the logged y-axis and converted errors:
##D 
##D fitGAMAsmVsizelogre=hyper.fit(GAMAsmVsize[,c('logmstar', 'logrekpc')],
##D vars=GAMAsmVsize[,c('logmstar_err', 'logrekpc_err')]^2, weights=GAMAsmVsize[,'weights'],
##D coord.type='alpha', scat.type='vert.axis')
##D #We turn the ellipse plotting off to speed things up:
##D plot(fitGAMAsmVsizelogre, doellipse=FALSE, unlog='xy')
##D 
##D #We can compare to a fit with no errors used:
##D 
##D fitGAMAsmVsizelogrenoerr=hyper.fit(GAMAsmVsize[,c('logmstar', 'logrekpc')],
##D weights=GAMAsmVsize[,'weights'], coord.type='alpha', scat.type='vert.axis')
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



