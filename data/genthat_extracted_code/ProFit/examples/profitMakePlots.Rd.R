library(ProFit)


### Name: profitMakePlots
### Title: Plot Image, Model and Residuals
### Aliases: profitMakePlots
### Keywords: plot

### ** Examples

# Load ProFit example data

# There are 2 data source options: KiDS or SDSS (the galaxies are the same)

datasource='KiDS' 

# Now we can extract out the example files we have available for fitting by checking the
# contents of the directory containing the example FITS files:

data('ExampleInit')
ExampleFiles=list.files(system.file("extdata",datasource,package="ProFit"))
ExampleIDs=unlist(strsplit(ExampleFiles[grep('fitim',ExampleFiles)],'fitim.fits'))
print(ExampleIDs)

# There are 10 example galaxies included. Here we run example 1:

useID=ExampleIDs[1]

image = readFITS(system.file("extdata", paste(datasource,'/',useID,'fitim.fits',sep=''),
package="ProFit"))$imDat
sigma = readFITS(system.file("extdata", paste(datasource,'/',useID,'sigma.fits',sep=''),
package="ProFit"))$imDat
segim = readFITS(system.file("extdata", paste(datasource,'/',useID,'segim.fits',sep=''),
package="ProFit"))$imDat

noise = sigma
set.seed(666)
noise[] = rnorm(length(noise),mean=0,sd=noise)
region = segim == segim[dim(segim)[1]/2,dim(segim)[2]/2]

profitMakePlots(image = image, modelimage = image+noise, region = region, sigma = sigma, 
  errischisq = FALSE, plotchisq = TRUE, dofs = c(2))



