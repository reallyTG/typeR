## ---- eval=FALSE---------------------------------------------------------
#  library(devtools)
#  install_github('asgr/ProFound')
#  install_github('ICRAR/ProFit')

## ------------------------------------------------------------------------
evalglobal=FALSE

## ------------------------------------------------------------------------
library(ProFound)

## ---- eval=evalglobal----------------------------------------------------
#  library(ProFit)
#  library(LaplacesDemon)

## ---- eval=TRUE, fig.width=6, fig.height=6, dpi=40-----------------------
set.seed(666)
sky=c(rnorm(5e5,mean=0,sd=1),(rnorm(5e5,mean=0,sd=1)+runif(5e5,0,100)))
maghist(sky, xlab='Pixel Value', ylab='Counts', grid=TRUE)

## ---- eval=TRUE----------------------------------------------------------
sky_clip_both=magclip(sky)
sky_clip_lo=magclip(sky, estimate='lo')

## ---- eval=TRUE, fig.width=6, fig.height=6, dpi=40-----------------------
magplot(density(sky_clip_both$x), col='red', grid=TRUE, xlab='Pixel Value', ylab='PDF')
lines(density(sky_clip_lo$x), col='blue')

## ---- eval=TRUE, fig.width=6, fig.height=6, dpi=40-----------------------
magplot(density(sky_clip_lo$x), col='blue', grid=TRUE, xlab='Sky Pixel Value', ylab='PDF')
lines(seq(-5,5,len=1e3), dnorm(seq(-5,5,len=1e3)), col='black', grid=TRUE)

## ---- eval=TRUE----------------------------------------------------------
median(sky_clip_lo$x)
diff(quantile(sky_clip_lo$x, pnorm(c(-1,0))))

## ---- eval=TRUE----------------------------------------------------------
mean(sky_clip_lo$x)
sd(sky_clip_lo$x)

## ---- eval=evalglobal----------------------------------------------------
#  image=readFITS(system.file("extdata", 'VIKING/mystery_VIKING_Z.fits', package="ProFound"))
#  profound=profoundProFound(image, skycut=1, magzero=30, plot=TRUE)

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  magimage(profound$sky)
#  magimage(profound$skyRMS)
#  
#  maghist(profound$sky, xlab='Pixel Value', ylab='Counts', grid=TRUE)
#  maghist(profound$skyRMS, xlab='Pixel Value', ylab='Counts', grid=TRUE)

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  ExamplePSF=profitMakeGaussianPSF(fwhm=5)
#  ExamplePSF=ExamplePSF/sum(ExamplePSF)
#  
#  model_test=list(
#  	sersic=list(
#  		xcen=runif(67,0,356),
#  		ycen=runif(67,0,356),
#  		mag=profound$segstats$mag,
#  		re=profound$segstats$R50,
#  		nser=runif(67,0.5,4),
#  		ang=runif(67,0,180),
#  		axrat=runif(67,0.3,1),
#  		box=rep(0,67)
#  	)
#  )
#  
#  im_test<-profitMakeModel(modellist=model_test, psf=ExamplePSF, dim=c(356,356), magzero = 30)$z

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  magimage(im_test)

## ---- eval=evalglobal----------------------------------------------------
#  im_test_noise=im_test+rnorm(356^2, mean=profound$sky, sd=profound$skyRMS)

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  magimage(im_test_noise)

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  profound_resim=profoundProFound(im_test_noise, skycut=1, magzero=30, plot=TRUE)

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  magimage(profound$sky)
#  magimage(profound$skyRMS)
#  
#  magimage(profound_resim$sky)
#  magimage(profound_resim$skyRMS)
#  
#  magimage(profound$sky-profound_resim$sky)
#  magimage(profound$skyRMS-profound_resim$skyRMS)

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  maghist(profound$sky, xlab='Pixel Value', ylab='Counts', grid=TRUE)
#  maghist(profound$skyRMS, xlab='Pixel Value', ylab='Counts', grid=TRUE)
#  
#  maghist(profound_resim$sky, xlab='Pixel Value', ylab='Counts', grid=TRUE)
#  maghist(profound_resim$skyRMS, xlab='Pixel Value', ylab='Counts', grid=TRUE)
#  
#  maghist(profound$sky-profound_resim$sky, xlab='Pixel Value', ylab='Counts', grid=TRUE)
#  maghist(profound$skyRMS-profound_resim$skyRMS, xlab='Pixel Value', ylab='Counts', grid=TRUE)

## ---- eval=evalglobal----------------------------------------------------
#  sd(profound$sky)
#  sd(profound$sky-profound_resim$sky)
#  
#  sd(profound$skyRMS)
#  sd(profound$skyRMS-profound_resim$skyRMS)

## ---- eval=evalglobal----------------------------------------------------
#  contam=seq(1e5, 2e6, by=1e5)
#  N=length(contam)
#  output=cbind(contam,rep(0,N), rep(0,N), rep(0,N), rep(0,N))
#  for(i in 1:N){
#    sky=c(rnorm(5e5,mean=0,sd=1),(rnorm(contam[i],mean=0,sd=1)+runif(contam[i],0,100)))
#    sky_clip_lo=magclip(sky, estimate='lo')
#    output[i,2]=as.numeric(median(sky_clip_lo$x))
#    output[i,3]=as.numeric(diff(quantile(sky_clip_lo$x, pnorm(c(-1,0)))))
#    output[i,4]=as.numeric(mean(sky_clip_lo$x))
#    output[i,5]=as.numeric(sd(sky_clip_lo$x))
#  }

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  magplot(1-output[,1]/(5e5+output[,1]),output[,2], log='y', grid=TRUE, xlab='Nsky/Ntotal', ylab='(Sky Estimate) - (Sky Input)', type='l', col='red')
#  lines(1-output[,1]/(5e5+output[,1]),output[,4], col='blue')
#  legend('topright', legend=c('Median','Mean'), lty=1, col=c('red','blue'))
#  
#  magplot(1-output[,1]/(5e5+output[,1]),output[,3]-1, log='y', grid=TRUE, xlab='Nsky/Ntotal', ylab='(Sky-RMS Estimate) - (Sky-RMS Input)', type='l', col='red')
#  lines(1-output[,1]/(5e5+output[,1]),output[,5]-1, col='blue')
#  legend('topright', legend=c('Quantile Range','Standard-Deviation'), lty=1, col=c('red','blue'))

## ---- eval=evalglobal----------------------------------------------------
#  profound_median_clip=profoundProFound(image, skycut=1.0, magzero=30, skytype='median', doclip=TRUE) #The default mode
#  profound_median_noclip=profoundProFound(image, skycut=1.0, magzero=30, skytype='median', doclip=FALSE)
#  profound_mean_clip=profoundProFound(image, skycut=1.0, magzero=30, skytype='mean', doclip=TRUE)
#  profound_mean_noclip=profoundProFound(image, skycut=1.0, magzero=30, skytype='mean', doclip=FALSE)
#  profound_mode_clip=profoundProFound(image, skycut=1.0, magzero=30, skytype='mode', doclip=TRUE)
#  profound_mode_noclip=profoundProFound(image, skycut=1.0, magzero=30, skytype='mode', doclip=FALSE)

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  maghist(profound_median_clip$sky-profound_median_noclip$sky, grid=TRUE)
#  maghist(profound_mean_clip$sky-profound_mean_noclip$sky, grid=TRUE)
#  maghist(profound_mode_clip$sky-profound_mode_noclip$sky, grid=TRUE)

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  maghist(profound_mean_clip$sky-profound_median_clip$sky, grid=TRUE)
#  maghist(profound_mode_clip$sky-profound_median_clip$sky, grid=TRUE)
#  maghist(profound_mean_clip$sky-profound_mode_clip$sky, grid=TRUE)

## ---- eval=evalglobal, fig.width=8, fig.height=5, dpi=40-----------------
#  magplot(profound_median_clip$segstats$mag, profound_median_clip$segstats$mag-profound_mean_clip$segstats$mag, ylim=c(-0.1,0.1), xlab='Median mag', ylab='(Median mag) - (Mean mag)', grid=TRUE)
#  lines(magrun(profound_median_clip$segstats$mag, profound_median_clip$segstats$mag-profound_mean_clip$segstats$mag), col='red')

## ---- eval=evalglobal----------------------------------------------------
#  profound=profoundProFound(image, type="bicubic")
#  newsky=profoundSkySplitFFT(image$imDat, objects=profound$objects_redo, sky=profound$sky, skyRMS=profound$skyRMS)

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  magimage(profound$sky)
#  magimage(newsky$sky)

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  magimage(image$imDat)
#  magimage(image$imDat-profound$sky)
#  magimage(image$imDat-newsky$sky)

## ---- eval=evalglobal, fig.width=6, fig.height=6, dpi=40-----------------
#  magimage(profoundSkySplitFFT(image$imDat)$sky_lo)
#  magimage(profoundSkySplitFFT(image$imDat)$sky_hi)

