## ---- eval=FALSE---------------------------------------------------------
#  library(devtools)
#  install_github('asgr/ProFound')
#  install_github('ICRAR/ProFit')

## ------------------------------------------------------------------------
evalglobal=FALSE

## ---- eval=evalglobal----------------------------------------------------
#  library(ProFound)
#  library(ProFit)
#  library(LaplacesDemon)

## ---- eval=evalglobal----------------------------------------------------
#  set.seed(666)
#  
#  ExamplePSF=profitMakeGaussianPSF(fwhm=5)
#  ExamplePSF=ExamplePSF/sum(ExamplePSF)
#  
#  Ngal=200
#  Nstar=200
#  
#  model_test=list(
#  	sersic=list(
#  		xcen=runif(Ngal,0,1000),
#  		ycen=runif(Ngal,0,1000),
#  		mag=24-rpareto(Ngal,2),
#  		re=rpois(Ngal,5)+runif(Ngal),
#  		nser=runif(Ngal,1,4),
#  		ang=runif(Ngal,0,180),
#  		axrat=runif(Ngal,0.3,1),
#  		box=runif(Ngal,-0.3,0.3)
#  	),
#  	pointsource=list(
#  		xcen=runif(Nstar,0,1000),
#  		ycen=runif(Nstar,0,1000),
#  		mag=24-rpareto(Nstar,1.5)
#  	)
#  )
#  
#  model_test$sersic$mag[model_test$sersic$mag<15]=runif(length(which(model_test$sersic$mag<15)),15,22)
#  model_test$pointsource$mag[model_test$pointsource$mag<15]=runif(length(which(model_test$pointsource$mag<15)),15,22)
#  
#  im_test<-profitMakeModel(modellist=model_test, psf=ExamplePSF, dim=c(1000,1000), magzero = 30)$z

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  magimage(im_test)

## ---- eval=evalglobal----------------------------------------------------
#  im_test=im_test+rnorm(1e6,sd=sqrt(im_test))
#  im_test=im_test+rnorm(1e6,sd=10)

## ---- eval=evalglobal----------------------------------------------------
#  set.seed(666)
#  
#  model_sky=list(
#  	pointsource=list(
#  		xcen=runif(500,0,1000),
#  		ycen=runif(500,0,1000),
#  		mag=20-rpareto(500,1.5)
#  	)
#  )
#  
#  im_sky<-profitMakeModel(modellist=model_sky, psf=ExamplePSF, dim=c(1000,1000), magzero = 30)$z
#  im_sky=im_sky+rnorm(1e6,2,10)
#  grid_sky=profoundMakeSkyGrid(im_sky, type='bicubic')$sky
#  
#  im_test=im_test+grid_sky

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  magimage(im_test)
#  
#  magimage(im_test)
#  points(model_test$sersic$xcen, model_test$sersic$ycen, col='yellow')
#  points(model_test$pointsource$xcen, model_test$pointsource$ycen, col='green')

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  magimage(im_test)
#  
#  pro_test=profoundProFound(im_test, magzero=30, verbose=TRUE, plot=TRUE, boundstats=TRUE, pixscale=0.34, tolerance=2)
#  points(model_test$sersic$xcen, model_test$sersic$ycen, col='yellow')
#  points(model_test$pointsource$xcen, model_test$pointsource$ycen, col='green')

## ---- eval=evalglobal----------------------------------------------------
#  testmatch_gals=coordmatch(cbind(model_test$sersic$xcen,model_test$sersic$ycen)/3600, pro_test$segstats[,c("xcen","ycen")]/3600,5)
#  
#  testmatch_stars=coordmatch(cbind(model_test$pointsource$xcen,model_test$pointsource$ycen)/3600,pro_test$segstats[,c("xcen","ycen")]/3600,5)

## ---- eval=evalglobal----------------------------------------------------
#  magplot(model_test$sersic$mag[testmatch_gals$bestmatch$refID], model_test$sersic$mag[testmatch_gals$bestmatch$refID]-pro_test$segstats[testmatch_gals$bestmatch$compareID,'mag'], grid=TRUE, ylim=c(-1,1), col='blue')
#  points(pro_test$segstats$mag, pro_test$segstats$mag_err, pch='.')
#  points(pro_test$segstats$mag, -pro_test$segstats$mag_err, pch='.')
#  
#  points(model_test$pointsource$mag[testmatch_stars$bestmatch$refID], model_test$pointsource$mag[testmatch_stars$bestmatch$refID]-pro_test$segstats[testmatch_stars$bestmatch$compareID,'mag'],col='red')

## ---- eval=evalglobal----------------------------------------------------
#  magplot(density(pro_test$sky))
#  lines(density(grid_sky), col='red')
#  
#  skyRMSerror=sd(pro_test$skyRMS)
#  maghist(pro_test$skyRMS, breaks=100)
#  abline(v=c(10-skyRMSerror,10,10+skyRMSerror), lty=c(3,2,3), col='red')

## ---- eval=evalglobal----------------------------------------------------
#  im_test_sub=im_test
#  im_test_sub[pro_test$objects_redo==1]=rnorm(length(which(pro_test$objects_redo==1)), mean=pro_test$sky[pro_test$objects_redo==1], sd=pro_test$skyRMS[pro_test$objects_redo==1])

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  magimage(pro_test$objects_redo)
#  points(model_test$sersic$xcen, model_test$sersic$ycen, col='yellow')
#  points(model_test$pointsource$xcen, model_test$pointsource$ycen, col='green')
#  
#  magimage(im_test_sub)
#  
#  magimage(im_test_sub)
#  points(model_test$sersic$xcen, model_test$sersic$ycen, col='yellow')
#  points(model_test$pointsource$xcen, model_test$pointsource$ycen, col='green')
#  
#  magimage(profoundImBlur(im_test_sub,5))
#  
#  magimage(profoundImBlur(im_test_sub,5))
#  points(model_test$sersic$xcen, model_test$sersic$ycen, col='yellow')
#  points(model_test$pointsource$xcen, model_test$pointsource$ycen, col='green')

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  magimage(im_test)
#  
#  pro_test_sub=profoundProFound(image=im_test_sub, mask=pro_test$objects, sky=pro_test$sky, skyRMS=pro_test$skyRMS, magzero=30, skycut=0.15, pixcut=3, verbose=TRUE, plot=TRUE, boundstats=TRUE, pixscale=0.34, tolerance=2, sigma=5)
#  points(model_test$sersic$xcen, model_test$sersic$ycen, col='yellow',cex=0.5)
#  points(model_test$pointsource$xcen, model_test$pointsource$ycen, col='green',cex=0.5)

## ---- eval=evalglobal----------------------------------------------------
#  faintcat=pro_test_sub$segstats[pro_test_sub$segstats$Nborder==0,]

## ---- eval=evalglobal----------------------------------------------------
#  finalcat=rbind(pro_test$segstats, faintcat)
#  dim(finalcat)

## ---- eval=evalglobal----------------------------------------------------
#  testmatch_gals_fin=coordmatch(cbind(model_test$sersic$xcen,model_test$sersic$ycen)/3600,  finalcat[,c("xcen","ycen")]/3600,5)
#  
#  testmatch_stars_fin=coordmatch(cbind(model_test$pointsource$xcen,model_test$pointsource$ycen)/3600, finalcat[,c("xcen","ycen")]/3600,5)

## ---- eval=evalglobal----------------------------------------------------
#  im_test_fin=im_test_sub-pro_test_sub$sky
#  im_test_fin[pro_test_sub$objects_redo==1]=rnorm(length(which(pro_test_sub$objects_redo==1)), mean=0, sd=pro_test_sub$skyRMS[pro_test_sub$objects_redo==1])
#  im_test_fin=im_test_fin/pro_test_sub$skyRMS

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  magimage(profoundPixelCorrelation(im_test, skyRMS=10, plot=TRUE)$fft, xlab='kx (2pi/1000pix)', ylab='ky (2pi/1000pix)'); points(0,0,cex=5,col='red')
#  
#  magimage(profoundPixelCorrelation(im_test_sub, skyRMS=10, plot=TRUE)$fft, xlab='kx (2pi/1000pix)', ylab='ky (2pi/1000pix)'); points(0,0,cex=5,col='red')
#  
#  magimage(profoundPixelCorrelation(im_test_fin, skyRMS=1, plot=TRUE)$fft, xlab='kx (2pi/1000pix)', ylab='ky (1000/pix)'); points(0,0,cex=5,col='red')
#  
#  magimage(profoundPixelCorrelation(matrix(rnorm(1e6, mean=0, sd=10), 1000), skyRMS=10, plot=TRUE)$fft, xlab='kx (2pi/1000pix)', ylab='ky (2pi/1000pix)'); points(0,0,cex=5,col='red')

## ---- eval=evalglobal, dpi=40--------------------------------------------
#  magplot(density(finalcat$SB_N100, na.rm=TRUE), xlab='Surface Brightness / mag/asec^-2', ylab='PDF')
#  abline(v=mean(pro_test$SBlim), col='red')

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  pro_test_2=profoundProFound(im_test, magzero=30, skycut=0.9, pixcut=3, verbose=TRUE, plot=TRUE, boundstats=TRUE, pixscale=0.34, tolerance=2)

## ---- eval=evalglobal----------------------------------------------------
#  testmatch_gals_2=coordmatch(cbind(model_test$sersic$xcen,model_test$sersic$ycen)/3600, pro_test_2$segstats[,c("xcen","ycen")]/3600,5)
#  
#  testmatch_stars_2=coordmatch(cbind(model_test$pointsource$xcen,model_test$pointsource$ycen)/3600,pro_test_2$segstats[,c("xcen","ycen")]/3600,5)

## ---- eval=evalglobal----------------------------------------------------
#  pro_test_sc1=profoundProFound(im_test, magzero=30, skycut=1, plot=FALSE, boundstats=TRUE, pixscale=0.34, tolerance=2)
#  pro_test_sc2=profoundProFound(im_test, magzero=30, skycut=2, plot=FALSE, boundstats=TRUE, pixscale=0.34, tolerance=2)
#  pro_test_sc4=profoundProFound(im_test, magzero=30, skycut=4, plot=FALSE, boundstats=TRUE, pixscale=0.34, tolerance=2)

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  profoundPixelCorrelation(im_test, objects = pro_test_sc1$objects_redo, sky=pro_test_sc1$sky, skyRMS=pro_test_sc1$skyRMS, plot=TRUE, ylim=c(-0.1,0.1))
#  profoundPixelCorrelation(im_test, objects = pro_test_sc2$objects_redo, sky=pro_test_sc2$sky, skyRMS=pro_test_sc2$skyRMS, plot=TRUE, ylim=c(-0.1,0.1))
#  profoundPixelCorrelation(im_test, objects = pro_test_sc4$objects_redo, sky=pro_test_sc4$sky, skyRMS=pro_test_sc4$skyRMS, plot=TRUE, ylim=c(-0.1,0.1))

## ---- eval=evalglobal----------------------------------------------------
#  pro_bicubic=profoundProFound(im_test, type='bicubic')

## ---- eval=evalglobal----------------------------------------------------
#  newsky=profoundSkySplitFFT(im_test, objects=pro_bicubic$objects_redo, sky=pro_bicubic$sky, skyRMS=pro_bicubic$skyRMS, skyscale=200)

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  magimage(grid_sky)
#  magimage(pro_bicubic$sky)
#  magimage(newsky$sky)

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  magplot(density(newsky$sky-grid_sky, bw=0.1), col='red', grid=TRUE)
#  lines(density(pro_bicubic$sky-grid_sky, bw=0.1), col='blue')
#  legend('topright', legend=c('New - Intrinsic Sky', 'Old - Intrinsic Sky'), lty=1, col=c('red','blue'))

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  magimage(newsky$sky_hi)

