## ---- eval=FALSE---------------------------------------------------------
#  library(devtools)
#  install_github('ICRAR/ProFit')

## ------------------------------------------------------------------------
library(ProFit)

## ------------------------------------------------------------------------
data('ExampleInit', package="ProFit")
head(ExampleInit, 10)

## ------------------------------------------------------------------------
datasource='SDSS'

## ------------------------------------------------------------------------
ExampleFiles=list.files(system.file("extdata",datasource,package="ProFit"))
ExampleIDs=unlist(strsplit(ExampleFiles[grep('fitim',ExampleFiles)],'fitim.fits'))
ExampleIDs

## ------------------------------------------------------------------------
useID=ExampleIDs[1]
psf=readFITS(system.file("extdata", paste(datasource,'/',useID,'psfim.fits',sep=''),package="ProFit"))$imDat
psf=psf/sum(psf)
psfsigma=sqrt(abs(psf))/200 #To get reasonable PSF errors

## ---- fig.width=5, fig.height=5, eval=FALSE------------------------------
#  temp=magimage(psf,lo=0,hi=1)
#  contour(temp, add=T, col='red', drawlabels=FALSE)

## ---- fig.width=5, fig.height=5, eval=FALSE------------------------------
#  magplot(psf[13,],type='l')
#  lines(psf[12,],lty=2,col='red')
#  lines(psf[14,],lty=2,col='blue')
#  lines(psf[11,],lty=3,col='red')
#  lines(psf[15,],lty=3,col='blue')

## ------------------------------------------------------------------------
modellist=list(
  moffat=list(
    xcen=dim(psf)[1]/2,
    ycen=dim(psf)[2]/2,
    mag=0,
    fwhm=2.5,
    con=3,
    ang=0,
    axrat=0.9,
    box=0
  )
)
modellist

## ------------------------------------------------------------------------
psfmodel=profitMakeModel(modellist,dim=c(25,25))$z

## ---- fig.width=5, fig.height=5, eval=FALSE------------------------------
#  magimage(psfmodel)
#  magimage(abs(psfmodel-psf)/psfmodel,zlim=c(0,1))

## ------------------------------------------------------------------------
tofit=list(
  moffat=list(
    xcen=TRUE,
    ycen=TRUE,
    mag=TRUE,
    fwhm=TRUE,
    con=TRUE,
    ang=TRUE,
    axrat=TRUE,
    box=TRUE
  )
)

## ------------------------------------------------------------------------
tolog=list(
  moffat=list(
    xcen=FALSE,
    ycen=FALSE,
    mag=FALSE,
    fwhm=FALSE,
    con=TRUE,
    ang=FALSE,
    axrat=TRUE,
    box=FALSE
  )
)

## ------------------------------------------------------------------------
intervals=list(
  moffat=list(
    xcen=list(lim=c(0,25)),
    ycen=list(lim=c(0,25)),
    mag=list(lim=c(-1,1)),
    fwhm=list(lim=c(0.1,10)),
    con=list(lim=c(1,20)),
    ang=list(lim=c(-180,360)),
    axrat=list(lim=c(0.1,1)),
    box=list(lim=c(-1,1))
  )
)

## ------------------------------------------------------------------------
Data=profitSetupData(image=psf, mask=(psf==0), sigma=psfsigma, modellist=modellist, tofit=tofit, tolog=tolog, intervals=intervals, magzero=0, algo.func='optim', verbose=TRUE, like.func='norm')

## ----  fig.width=7, fig.height=5, eval=FALSE-----------------------------
#  profitLikeModel(parm=Data$init, Data=Data, makeplots=TRUE, plotchisq=TRUE)

## ---- fig.height=5, fig.width=5, eval=FALSE------------------------------
#  optimfit=optim(Data$init, profitLikeModel, method='BFGS', Data=Data, control=list(fnscale=-1))

## ---- fig.width=8, fig.height=5, eval=FALSE------------------------------
#  profitLikeModel(optimfit$par, Data,makeplots=TRUE, plotchisq=TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  Data$algo.func="LD"
#  
#  LDfit=LaplacesDemon(profitLikeModel, Initial.Values=optimfit$par, Data=Data,
#    Iterations=1e4, Algorithm='CHARM', Thinning=1, Specs=list(alpha.star=0.44))

## ---- eval=FALSE---------------------------------------------------------
#  profitLikeModel(LDfit$Summary2[,1], Data,makeplots=TRUE, plotchisq=TRUE)

## ---- fig.width=5, fig.height=5, eval=FALSE------------------------------
#  PSFmodellist=profitRemakeModellist(optimfit$par, modellist, tofit=tofit, tolog=tolog, intervals=intervals)$modellist
#  PSFmodellist$moffat$xcen=12.5
#  PSFmodellist$moffat$ycen=12.5
#  PSFmodellist$moffat$mag=0
#  psfmodel=profitMakeModel(PSFmodellist, dim=c(25,25))$z
#  contour(magimage(psfmodel), add=TRUE, col='red', drawlabels=FALSE)

## ------------------------------------------------------------------------
useID=ExampleIDs[1]
image=readFITS(system.file("extdata", paste(datasource,'/',useID,'fitim.fits',sep=''), package="ProFit"))$imDat
sigma=readFITS(system.file("extdata", paste(datasource,'/',useID,'sigma.fits',sep=''), package="ProFit"))$imDat
segim=readFITS(system.file("extdata", paste(datasource,'/',useID,'segim.fits',sep=''), package="ProFit"))$imDat

## ------------------------------------------------------------------------
useIDnum=as.integer(strsplit(useID,'G')[[1]][2])
useloc=which(ExampleInit$CATAID==useIDnum)

## ------------------------------------------------------------------------
modellist=list(
  sersic=list(
    xcen= c(dim(image)[1]/2, dim(image)[1]/2),
    ycen= c(dim(image)[2]/2, dim(image)[2]/2),
    mag= c(ExampleInit$sersic.mag1[useloc], ExampleInit$sersic.mag2[useloc]),
    re= c(ExampleInit$sersic.re1[useloc], ExampleInit$sersic.re2[useloc])*
      if(datasource=='KiDS'){1}else{0.2/0.339},
    nser= c(ExampleInit$sersic.nser1[useloc], 1),  #Disk is initially nser=1
    ang= c(ExampleInit$sersic.ang2[useloc], ExampleInit$sersic.ang2[useloc]),
    axrat= c(1, ExampleInit$sersic.axrat2[useloc]),  #Bulge is initially axrat=1
    box=c(0, 0)
  )
)
modellist

## ---- fig.width=5, fig.height=5, dpi=40----------------------------------
magimage(profitMakeModel(modellist,dim=dim(image)))

## ---- fig.width=5, fig.height=5, dpi=40----------------------------------
magimage(image)

## ---- fig.width=5, fig.height=5, dpi=40----------------------------------
magimage(profitMakeModel(modellist,dim=dim(image),psf=psfmodel))

## ------------------------------------------------------------------------
tofit=list(
  sersic=list(
    xcen= c(TRUE,NA), #We fit for xcen and tie the two togther
    ycen= c(TRUE,NA), #We fit for ycen and tie the two togther
    mag= c(TRUE,TRUE), #Fit for both
    re= c(TRUE,TRUE), #Fit for both
    nser= c(TRUE,FALSE), #Fit for bulge
    ang= c(FALSE,TRUE), #Fit for disk
    axrat= c(FALSE,TRUE), #Fit for disk
    box= c(FALSE,FALSE) #Fit for neither
  )
)

## ------------------------------------------------------------------------
tolog=list(
  sersic=list(
    xcen= c(FALSE,FALSE),
    ycen= c(FALSE,FALSE),
    mag= c(FALSE,FALSE),
    re= c(TRUE,TRUE), #re is best fit in log space
    nser= c(TRUE,TRUE), #nser is best fit in log space
    ang= c(FALSE,FALSE),
    axrat= c(TRUE,TRUE), #axrat is best fit in log space
    box= c(FALSE,FALSE)
  )
)

## ------------------------------------------------------------------------
intervals=list(
  sersic=list(
    xcen=list(lim=c(0,300),lim=c(0,300)),
    ycen=list(lim=c(0,300),lim=c(0,300)),
    mag=list(lim=c(10,30),lim=c(10,30)),
    re=list(lim=c(1,100),lim=c(1,100)),
    nser=list(lim=c(0.5,20),lim=c(0.5,20)),
    ang=list(lim=c(-180,360),lim=c(-180,360)),
    axrat=list(lim=c(0.1,1),lim=c(0.1,1)),
    box=list(lim=c(-1,1),lim=c(-1,1))
  )
)

## ------------------------------------------------------------------------
Data=profitSetupData(image=image, sigma=sigma, segim=segim, psf=psfmodel,
                     modellist=modellist, tofit=tofit, tolog=tolog, intervals=intervals,
                     magzero=0, algo.func='optim', like.func="t", verbose=TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  optimfitMod=optim(Data$init, profitLikeModel, method='BFGS', Data=Data,
#                    control=list(fnscale=-1))

## ---- eval=FALSE---------------------------------------------------------
#  optimfitMod$par

## ---- eval=FALSE---------------------------------------------------------
#  profitLikeModel(optimfitMod$par,Data,makeplots=TRUE,whichcomponents=list(sersic=1))
#  profitLikeModel(optimfitMod$par,Data,makeplots=TRUE,whichcomponents=list(sersic=2))
#  profitLikeModel(optimfitMod$par,Data,makeplots=TRUE,whichcomponents=list(sersic='all'))

## ---- eval=FALSE---------------------------------------------------------
#  modeloptim=profitRemakeModellist(optimfitMod$par,Data$modellist,Data$tofit,Data$tolog)$modellist
#  profitEllipsePlot(Data,modeloptim,pixscale=0.339,FWHM=1,SBlim=26)

## ------------------------------------------------------------------------
Data=profitSetupData(image=image, sigma=sigma, segim=segim, psf=psf,
  modellist=modellist, tofit=tofit, tolog=tolog, intervals=intervals, magzero=0,
  algo.func='optim', like.func="t", verbose=TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  optimfitEmp=optim(Data$init, profitLikeModel, method='BFGS', Data=Data,
#                    control=list(fnscale=-1))

## ---- eval=FALSE---------------------------------------------------------
#  optimfitEmp$par

## ---- fig.width=5, fig.height=5, eval=FALSE------------------------------
#  profitLikeModel(optimfitEmp$par,Data,makeplots=TRUE,whichcomponents=list(sersic=1))
#  profitLikeModel(optimfitEmp$par,Data,makeplots=TRUE,whichcomponents=list(sersic=2))
#  profitLikeModel(optimfitEmp$par,Data,makeplots=TRUE,whichcomponents=list(sersic='all'))

## ---- fig.width=5, fig.height=5, eval=FALSE------------------------------
#  modeloptim=profitRemakeModellist(optimfitEmp$par,Data$modellist,Data$tofit,Data$tolog)$modellist
#  profitEllipsePlot(Data,modeloptim,pixscale=0.339,FWHM=1,SBlim=26)

