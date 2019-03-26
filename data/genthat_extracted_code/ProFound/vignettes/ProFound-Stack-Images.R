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

## ---- eval=evalglobal----------------------------------------------------
#  im_test1=im_test+rnorm(1e6,sd=sqrt(im_test))
#  im_test1=im_test1+rnorm(1e6,sd=10)
#  im_test2a=im_test+rnorm(1e6,sd=2*sqrt(im_test))
#  im_test2a=im_test2a+rnorm(1e6,sd=2*10)
#  im_test2b=im_test+rnorm(1e6,sd=2*sqrt(im_test))
#  im_test2b=im_test2b+rnorm(1e6,sd=2*10)
#  im_test2c=im_test+rnorm(1e6,sd=2*sqrt(im_test))
#  im_test2c=im_test2c+rnorm(1e6,sd=2*10)
#  im_test2d=im_test+rnorm(1e6,sd=2*sqrt(im_test))
#  im_test2d=im_test2d+rnorm(1e6,sd=2*10)

## ---- eval=evalglobal----------------------------------------------------
#  pro_test1=profoundProFound(im_test1, skycut=1)
#  pro_test2a=profoundProFound(im_test2a, skycut=1)
#  pro_test2b=profoundProFound(im_test2b, skycut=1)
#  pro_test2c=profoundProFound(im_test2c, skycut=1)
#  pro_test2d=profoundProFound(im_test2d, skycut=1)

## ---- eval=evalglobal----------------------------------------------------
#  stack=profoundMakeStack(image_list = list(im_test1, im_test2a, im_test2b, im_test2c, im_test2d), sky_list = list(pro_test1$sky, pro_test2a$sky, pro_test2b$sky, pro_test2c$sky, pro_test2d$sky), skyRMS_list = list(pro_test1$skyRMS, pro_test2a$skyRMS, pro_test2b$skyRMS, pro_test2c$skyRMS, pro_test2d$skyRMS), magzero_in=c(30,30,30,30,30), magzero_out=30)

## ---- eval=evalglobal----------------------------------------------------
#  pro_stack=profoundProFound(stack$image, skycut=1)

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  maghist(pro_stack$skyRMS, grid=TRUE)
#  abline(v=7.07, col='red')

