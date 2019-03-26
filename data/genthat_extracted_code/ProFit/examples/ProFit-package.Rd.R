library(ProFit)


### Name: ProFit-package
### Title: Fit Projected 2D Profiles to Galaxy Images
### Aliases: ProFit-package ProFit profit
### Keywords: profile

### ** Examples

modellist = list(
  sersic = list(
    xcen   = c(180, 60),
    ycen   = c(90, 10),
    mag = c(15, 13),
    re  = c(14, 5),
    nser  = c(3, 10),
    ang  = c(46, 80),
    axrat  = c(0.4, 0.6),
    box = c(0.5,-0.5)
  ),
  pointsource = list(
    xcen   = c(34,10,150),
    ycen   = c(74,120,130),
    mag = c(10,13,16)
  ),
  sky = list(
    bg = 3e-12
  )
)

# Without a PSF provided only the extended sources are shown, with no convolution:

magimage(profitMakeModel(modellist=modellist, dim=c(200,200)))

# With a PSF provided the PSFs are displayed and the extended sources are convolved with
# the PSF:

magimage(profitMakeModel(modellist=modellist, psf=profitMakePointSource(), dim=c(200,200)))

############### Full L-BFGS-B fit example ##############

## Not run: 
##D 
##D # Load ProFit example data
##D 
##D # There are 2 data source options: KiDS or SDSS (the galaxies are the same)
##D 
##D datasource='KiDS' 
##D 
##D # Now we can extract out the example files we have available for fitting by checking the
##D # contents of the directory containing the example FITS files:
##D 
##D data('ExampleInit')
##D ExampleFiles=list.files(system.file("extdata",datasource,package="ProFit"))
##D ExampleIDs=unlist(strsplit(ExampleFiles[grep('fitim',ExampleFiles)],'fitim.fits'))
##D print(ExampleIDs)
##D 
##D # There are 10 example galaxies included. Here we run example 1:
##D 
##D useID=ExampleIDs[1]
##D 
##D image = readFITS(system.file("extdata", paste(datasource,'/',useID,'fitim.fits',sep=''),
##D package="ProFit"))$imDat
##D sigma = readFITS(system.file("extdata", paste(datasource,'/',useID,'sigma.fits',sep=''),
##D package="ProFit"))$imDat
##D segim = readFITS(system.file("extdata", paste(datasource,'/',useID,'segim.fits',sep=''),
##D package="ProFit"))$imDat
##D psf = readFITS(system.file("extdata", paste(datasource,'/',useID,'psfim.fits',sep=''),
##D package="ProFit"))$imDat
##D 
##D # Very rough model (not meant to look too good yet):
##D 
##D useIDnum=as.integer(strsplit(useID,'G')[[1]][2])
##D useloc=which(ExampleInit$CATAID==useIDnum)
##D 
##D # For our initial model we treat component 1 as the putitive bulge and componet 2 as
##D # the putitive disk. We are going to attempt a fit where the disk is forced to have
##D # nser=1 and the bulge has an axial ratio of 1.
##D 
##D modellist=list(
##D   sersic=list(
##D     xcen= c(dim(image)[1]/2, dim(image)[1]/2),
##D     ycen= c(dim(image)[2]/2, dim(image)[2]/2),
##D     mag= c(ExampleInit$sersic.mag1[useloc], ExampleInit$sersic.mag2[useloc]),
##D     re= c(ExampleInit$sersic.re1[useloc], ExampleInit$sersic.re2[useloc])*
##D       if(datasource=='KiDS'){1}else{0.2/0.339},
##D     nser= c(ExampleInit$sersic.nser1[useloc], 1),  #Disk is initially nser=1
##D     ang= c(ExampleInit$sersic.ang2[useloc], ExampleInit$sersic.ang2[useloc]),
##D     axrat= c(1, ExampleInit$sersic.axrat2[useloc]),  #Bulge is initially axrat=1
##D     box=c(0, 0)
##D   )
##D )
##D 
##D # The pure model (no PSF):
##D magimage(profitMakeModel(modellist,dim=dim(image)))
##D 
##D # The original image:
##D magimage(image)
##D 
##D # The convolved model (with PSF):
##D magimage(profitMakeModel(modellist,dim=dim(image),psf=psf))
##D 
##D # What should we be fitting:
##D 
##D tofit=list(
##D   sersic=list(
##D     xcen= c(TRUE,NA), #We fit for xcen and tie the two togther
##D     ycen= c(TRUE,NA), #We fit for ycen and tie the two togther
##D     mag= c(TRUE,TRUE), #Fit for both
##D     re= c(TRUE,TRUE), #Fit for both
##D     nser= c(TRUE,FALSE), #Fit for bulge
##D     ang= c(FALSE,TRUE), #Fit for disk
##D     axrat= c(FALSE,TRUE), #Fit for disk
##D     box= c(FALSE,FALSE) #Fit for neither
##D   )
##D )
##D 
##D # What parameters should be fitted in log space:
##D 
##D tolog=list(
##D   sersic=list(
##D     xcen= c(FALSE,FALSE),
##D     ycen= c(FALSE,FALSE),
##D     mag= c(FALSE,FALSE),
##D     re= c(TRUE,TRUE), #re is best fit in log space
##D     nser= c(TRUE,TRUE), #nser is best fit in log space
##D     ang= c(FALSE,FALSE),
##D     axrat= c(TRUE,TRUE), #axrat is best fit in log space
##D     box= c(FALSE,FALSE)
##D   )
##D )
##D 
##D # The hard interval limits to use when fitting. This is not strictly required, but without
##D # this we cannot ensure the sampler does not enter unallowed values like negative sizes,
##D # Sersic indices and axial ratios etc:
##D 
##D intervals=list(
##D   sersic=list(
##D     xcen=list(lim=c(0,300),lim=c(0,300)),
##D     ycen=list(lim=c(0,300),lim=c(0,300)),
##D     mag=list(lim=c(10,30),lim=c(10,30)),
##D     re=list(lim=c(1,100),lim=c(1,100)),
##D     nser=list(lim=c(0.5,20),lim=c(0.5,20)),
##D     ang=list(lim=c(-180,360),lim=c(-180,360)),
##D     axrat=list(lim=c(0.1,1),lim=c(0.1,1)),
##D     box=list(lim=c(-1,1),lim=c(-1,1))
##D   )
##D )
##D 
##D # Setup the minimal data structure we need for optimisation. See vignettes for
##D # more complex examples using priors, and constraints:
##D 
##D Data=profitSetupData(image=image, sigma=sigma, segim=segim,psf=psf,
##D modellist=modellist, tofit=tofit, tolog=tolog, intervals=intervals, magzero=0,
##D algo.func='optim', verbose=TRUE)
##D 
##D # This produces a fairly complex R object, but with all the bits we need for fitting,
##D # e.g. (notice the tolog parameteres are now logged):
##D 
##D Data$init
##D 
##D # These are the parameters we wish to fit for, and we take the initial guesses from the
##D # model list we provided before.
##D 
##D # We can test how things currently look (we get an output because we set verbose=TRUE
##D # earlier):
##D 
##D profitLikeModel(parm=Data$init, Data=Data, makeplots=TRUE)
##D 
##D # Let us try optim BFGS:
##D 
##D optimfit=optim(Data$init, profitLikeModel, method='BFGS', Data=Data,
##D control=list(fnscale=-1))
##D 
##D # The best optim BFGS fit is given by:
##D 
##D optimfit$par
##D 
##D # Check it out:
##D 
##D profitLikeModel(optimfit$par,Data,makeplots=TRUE,whichcomponents=list(sersic=1))
##D profitLikeModel(optimfit$par,Data,makeplots=TRUE,whichcomponents=list(sersic=2))
##D profitLikeModel(optimfit$par,Data,makeplots=TRUE,whichcomponents=list(sersic='all'))
##D 
##D modeloptim=profitRemakeModellist(optimfit$par,Data$modellist,Data$tofit,Data$tolog)$modellist
##D profitEllipsePlot(Data,modeloptim,pixscale=0.2,FWHM=0.5,SBlim=26)
## End(Not run)




