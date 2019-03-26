library(ProFit)


### Name: profitDataBenchmark
### Title: Setup ProFit Data Benchmarks
### Aliases: profitDataBenchmark
### Keywords: benchmark, data

### ** Examples

## Not run: 
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
##D box = c(160,160)
##D image = magcutout(readFITS(system.file("extdata", paste(datasource,'/',useID,'fitim.fits',sep=''),
##D package="ProFit"))$imDat, box = box)$image
##D sigma = magcutout(readFITS(system.file("extdata", paste(datasource,'/',useID,'sigma.fits',sep=''),
##D package="ProFit"))$imDat, box = box)$image
##D segim = magcutout(readFITS(system.file("extdata", paste(datasource,'/',useID,'segim.fits',sep=''),
##D package="ProFit"))$imDat, box = box)$image
##D psf = magcutout(readFITS(system.file("extdata", paste(datasource,'/',useID,'psfim.fits',sep=''),
##D package="ProFit"))$imDat, box = c(21,21))$image
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
##D     xcen= c(TRUE,NA), #We fit for xcen and tie the two together
##D     ycen= c(TRUE,NA), #We fit for ycen and tie the two together
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
##D # Setup the profit.data
##D 
##D openclenvs = data.frame()
##D 
##D Data=profitSetupData(image=image, sigma=sigma, segim=segim, psf=psf,
##D   modellist=modellist, tofit=tofit, tolog=tolog, magzero=0, algo.func='optim', verbose=TRUE,
##D   nbenchmark = 1L, benchconvmethods = "brute",
##D   benchintmethods = "brute", benchopenclenvs = openclenvs,
##D   finesample=4L, printbenchmark = TRUE)
##D 
##D system.time(profitLikeModel(parm=Data$init, Data=Data))
##D 
##D benchmarks = profitDataBenchmark(modellist = Data$modellist, calcregion = Data$calcregion,
##D   imgdim = dim(Data$image), finesample = Data$finesample, psf = Data$psf, fitpsf = Data$fitpsf,
##D   nbenchmark = 1L, benchconvmethods = profitAvailableConvolvers(),
##D   benchintmethods = profitAvailableIntegrators(), benchopenclenvs = openclenvs,
##D   printbenchmark = TRUE)
##D 
##D Data = profitDataSetOptionsFromBenchmarks(Data, benchmarks)
##D 
##D system.time(profitLikeModel(parm=Data$init, Data=Data))
## End(Not run)



