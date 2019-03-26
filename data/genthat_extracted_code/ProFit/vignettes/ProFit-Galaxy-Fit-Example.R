## ---- eval=FALSE---------------------------------------------------------
#  library(devtools)
#  install_github('ICRAR/ProFit')

## ------------------------------------------------------------------------
library(ProFit)

## ------------------------------------------------------------------------
data('ExampleInit', package="ProFit")
head(ExampleInit, 10)

## ------------------------------------------------------------------------
datasource='KiDS'

## ------------------------------------------------------------------------
ExampleFiles=list.files(system.file("extdata",datasource,package="ProFit"))
ExampleIDs=unlist(strsplit(ExampleFiles[grep('fitim',ExampleFiles)],'fitim.fits'))
ExampleIDs

## ------------------------------------------------------------------------
useID=ExampleIDs[1]
image=readFITS(system.file("extdata", paste(datasource,'/',useID,'fitim.fits',sep=''),package="ProFit"))$imDat
sigma=readFITS(system.file("extdata", paste(datasource,'/',useID,'sigma.fits',sep=''),package="ProFit"))$imDat
segim=readFITS(system.file("extdata", paste(datasource,'/',useID,'segim.fits',sep=''),package="ProFit"))$imDat
psf=readFITS(system.file("extdata", paste(datasource,'/',useID,'psfim.fits',sep=''),package="ProFit"))$imDat

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

## ---- fig.width=5, fig.height=5, eval=FALSE------------------------------
#  magimage(profitMakeModel(modellist,dim=dim(image)))

## ---- fig.width=5, fig.height=5, eval=FALSE------------------------------
#  magimage(image)

## ---- fig.width=5, fig.height=5, eval=FALSE------------------------------
#  magimage(profitMakeModel(modellist,dim=dim(image),psf=psf))

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
priors=function(new,init,sigmas=c(2,2,2,2,5,5,1,1,1,1,30,30,0.3,0.3)){
  LL=sum(
      dnorm(new$sersic$xcen,init$sersic$xcen,sigmas[1:2],log=TRUE),
      dnorm(new$sersic$ycen,init$sersic$ycen,sigmas[3:4],log=TRUE),
      dnorm(new$sersic$mag,init$sersic$mag,sigmas[5:6],log=TRUE),
      dnorm(log10(new$sersic$re),log10(init$sersic$re),sigmas[7:8],log=TRUE),
      dnorm(log10(new$sersic$nser),log10(init$sersic$nser),sigmas[9:10],log=TRUE),
      dnorm(log10(new$sersic$axrat),log10(init$sersic$axrat),sigmas[13:14],log=TRUE)
  )
  return(LL)
}
print(priors(modellist,modellist))

## ------------------------------------------------------------------------
sigmavec=c(2,2,5,1,1,30,0.3,0.2)
priors=function(new,init,sigmas=sigmavec){
  return(sum(2*dnorm(log10(new$sersic$re),log10(init$sersic$re),sigmas[4],log=TRUE)))
}
print(priors(modellist,modellist))

## ------------------------------------------------------------------------
sigmavec=sigmavec/2
print(priors(modellist,modellist))
print(priors)

## ------------------------------------------------------------------------
sigmas=c(2,2,5,1,1,30,0.3,Inf)

sigmas=list(
  sersic=list(
    xcen= numeric(2)+sigmas[1],
    ycen= numeric(2)+sigmas[2],
    mag= numeric(2)+sigmas[3],
    re= numeric(2)+sigmas[4],
    nser= numeric(2)+sigmas[5],
    ang= numeric(2)+sigmas[6],
    axrat= numeric(2)+sigmas[7],
    box= numeric(2)+sigmas[8]
  )
)

priors=profitMakePriors(modellist, sigmas, tolog, allowflat=TRUE)
print(priors(modellist,modellist))
print(priors)

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
Data=profitSetupData(image=image, sigma=sigma, segim=segim, psf=psf,
                     modellist=modellist, tofit=tofit, tolog=tolog, priors=priors,
                     intervals=intervals,magzero=0, algo.func='optim', like.func="t",
                     verbose=TRUE)

## ------------------------------------------------------------------------
Data$init

## ----  fig.width=7, fig.height=3, dpi=40---------------------------------
profitLikeModel(parm=Data$init, Data=Data, makeplots=TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  sigmas=c(2,2,2,2,5,5,1,1,1,1,30,30,0.3,0.3)
#  print(system.time({optimfit = optim(Data$init, profitLikeModel, method='BFGS', Data=Data,
#    control=list(fnscale=-1,parscale=sigmas[which(unlist(tofit))]))}))
#  print(optimfit$value)

## ---- eval=FALSE---------------------------------------------------------
#  optimfit$par

## ---- eval=FALSE---------------------------------------------------------
#  profitLikeModel(optimfit$par,Data,makeplots=TRUE,whichcomponents=list(sersic=1))
#  profitLikeModel(optimfit$par,Data,makeplots=TRUE,whichcomponents=list(sersic=2))
#  profitLikeModel(optimfit$par,Data,makeplots=TRUE,whichcomponents=list(sersic='all'))

## ---- eval=FALSE---------------------------------------------------------
#  modeloptim=profitRemakeModellist(parm=optimfit$par, Data=Data)$modellist
#  profitEllipsePlot(Data,modeloptim,pixscale=0.2,FWHM=0.5,SBlim=26)

## ------------------------------------------------------------------------
constraints=function(modellist){
  if(modellist$sersic$re[1]>modellist$sersic$re[2]){
    modellist$sersic$re[1]=modellist$sersic$re[2]
  }
  return=modellist
}
Data$constraints=constraints

## ---- eval=FALSE---------------------------------------------------------
#  if(isTRUE("nloptr" %in% rownames(installed.packages())))
#  {
#    library(nloptr)
#    intervals = unlist(Data$intervals)
#    tofit = unlist(Data$tofit)
#    npar = length(tofit)
#  
#    whichfit = which(tofit)
#    whichfitlog = which(unlist(Data$tolog)[whichfit])
#    lower = intervals[2*(1:npar)-1][whichfit]
#    upper = intervals[2*(1:npar)][whichfit]
#    lower[whichfitlog]=log10(lower[whichfitlog])
#    upper[whichfitlog]=log10(upper[whichfitlog])
#  
#    system.time({nloptfit = nloptr(
#      x0 = Data$init, eval_f=function(x,Data) { return(-profitLikeModel(x,Data=Data))}, lb = lower, ub = upper,
#      opts=list(algorithm=paste0("NLOPT_LN_NELDERMEAD"),xtol_rel=0,ftol_abs=1e-3,maxeval=2e3), Data=Data)})
#    print(-nloptfit$objective)
#  }

## ---- eval=FALSE---------------------------------------------------------
#  if(isTRUE("LaplacesDemon" %in% rownames(installed.packages())))
#  {
#    library(LaplacesDemon)
#    Data$algo.func="LA"
#    system.time({LAfit = LaplaceApproximation(profitLikeModel, parm=Data$init, Data=Data, Iterations=1e3,
#      Method='LM', CovEst='Identity', sir=FALSE)})
#    print(LAfit$LP.Final)
#    system.time({LAfitnm = LaplaceApproximation(profitLikeModel, parm=Data$init, Data=Data, Iterations=1e3,
#      Method='NM', CovEst='Identity', sir=FALSE)})
#    print(LAfitnm$LP.Final)
#  }

## ---- eval=FALSE---------------------------------------------------------
#  LAfit$Summary1[,1]

## ---- eval=FALSE---------------------------------------------------------
#  profitLikeModel(LAfit$Summary1[,1],Data,makeplots=TRUE,whichcomponents=list(sersic=1))
#  profitLikeModel(LAfit$Summary1[,1],Data,makeplots=TRUE,whichcomponents=list(sersic=2))
#  profitLikeModel(LAfit$Summary1[,1],Data,makeplots=TRUE,whichcomponents=list(sersic='all'))
#  
#  modelLA=profitRemakeModellist(LAfit$Summary1[,1],Data$modellist,Data$tofit,Data$tolog)$modellist
#  profitEllipsePlot(Data,modelLA,pixscale=0.2,FWHM=0.5,SBlim=26)

## ---- eval=FALSE---------------------------------------------------------
#  library(devtools)
#  install_github('taranu/cmaeshpc')

## ---- eval=FALSE---------------------------------------------------------
#  if(isTRUE("cmaeshpc" %in% rownames(installed.packages())))
#  {
#    library(cmaeshpc)
#    Data$algo.func="CMA"
#    sigmas=c(2,2,2,2,5,5,1,1,1,1,30,30,0.3,0.3)
#    cmasigma=sigmas[which(unlist(tofit) == TRUE)]/3
#    cmafit=cmaeshpc(Data$init, profitLikeModel, Data=Data, control=list(maxit=1e3,
#      fnscale=-1.0, sigma=cmasigma, diag.sigma=TRUE, diag.eigen=TRUE, diag.pop=TRUE,
#      diag.value=TRUE, maxwalltime=Inf, trace=TRUE, stopfitness=0, stop.tolx=1e-3*cmasigma))
#    profitLikeModel(cmafit$par,Data,makeplots=TRUE)
#  }

## ---- eval=FALSE---------------------------------------------------------
#  Data$algo.func="LD"
#  
#  LDfit=LaplacesDemon(profitLikeModel, Initial.Values=LAfit$Summary1[,1], Data=Data,
#    Iterations=1e4, Algorithm='CHARM', Thinning=1, Specs=list(alpha.star=0.44))

## ---- eval=FALSE---------------------------------------------------------
#  LDfit$Summary2

## ---- eval=FALSE---------------------------------------------------------
#  LDfit$Summary1

## ---- eval=FALSE---------------------------------------------------------
#  BestLD=magtri(LDfit$Posterior2, samples=500, samptype='ran')

## ---- eval=FALSE---------------------------------------------------------
#  BestLD=magtri(LDfit$Posterior1, samples=1000, samptype='end')

## ---- eval=FALSE---------------------------------------------------------
#  profitLikeModel(BestLD,Data,makeplots=TRUE,whichcomponents=list(sersic=1))
#  profitLikeModel(BestLD,Data,makeplots=TRUE,whichcomponents=list(sersic=2))
#  profitLikeModel(BestLD,Data,makeplots=TRUE,whichcomponents=list(sersic='all'))
#  
#  modelLD=profitRemakeModellist(BestLD,Data$modellist,Data$tofit,Data$tolog)$modellist
#  profitEllipsePlot(Data,modelLD,pixscale=0.2,FWHM=0.5,SBlim=26)

## ----eval=FALSE----------------------------------------------------------
#  Dataf=profitSetupData(image=image, sigma=sigma, segim=segim, psf=psf,
#    modellist=modellist, tofit=tofit, tolog=tolog, priors=priors, intervals=intervals,
#    magzero=0, algo.func='LD', verbose=TRUE, nbenchmark=3L, finesample=3L)

## ---- eval=FALSE---------------------------------------------------------
#  profitLikeModel(BestLD,Dataf,makeplots=TRUE,whichcomponents=list(sersic='all'))

## ---- eval=FALSE---------------------------------------------------------
#  Dataf$algo.func="LA"
#  LAfitf=LaplaceApproximation(profitLikeModel, parm=LAfit$Summary1[,1], Data=Dataf, Iterations=1e3,
#    Method='BFGS', CovEst='Identity', sir=FALSE)

## ---- eval=FALSE---------------------------------------------------------
#  profitLikeModel(LAfitf$Summary1[,1],Dataf,makeplots=TRUE)

## ---- eval=FALSE---------------------------------------------------------
#  Dataf$algo.func="LD"
#  
#  LDfitf=LaplacesDemon(profitLikeModel, Initial.Values=LAfitf$Summary1[,1], Data=Dataf,
#    Iterations=1e3, Algorithm='CHARM', Thinning=1, Specs=list(alpha.star=0.44))

## ---- eval=FALSE---------------------------------------------------------
#  LDfit$Summary2
#  LDfitf$Summary2
#  
#  BestLDf=magtri(LDfit$Posterior1, samptype='end')
#  profitLikeModel(BestLDf,Dataf,makeplots=TRUE)

