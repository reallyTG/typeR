library(ProFound)


### Name: profoundSkyEst
### Title: Old Sky Estimator (Somewhat Defunct)
### Aliases: profoundSkyEst
### Keywords: sky

### ** Examples

## Not run: 
##D image = readFITS(system.file("extdata", 'KiDS/G266035fitim.fits',
##D package="ProFit"))$imDat
##D sky1 = profoundSkyEst(image, plot=TRUE)
##D image_sky = image-sky1$sky
##D sky2 = profoundSkyEst(profoundImDiff(image_sky), plot=TRUE)
##D 
##D #You can check whether you are contaminated by the central objects by plotting the radrun
##D #object in the list (it should be flat for a well behaved sky):
##D sky = profoundSkyEst(image, cutlo=0, plot=TRUE)
##D magplot(sky$radrun)
##D abline(h=sky$sky)
##D 
##D #The above shows heavy contamination by the central object without. We can either mask
##D #this out using the output of profoundSegImWatershed, set cutlo to be larger or weight
##D #the sky towards outer annuli.
##D 
##D profound=profoundProFound(image)
##D sky = profoundSkyEst(image, mask=profound$objects, cutlo=0, plot=TRUE)
##D magplot(sky$radrun)
##D abline(h=sky$sky)
##D 
##D #The above is better, but not great. A more aggressive mask helps:
##D 
##D sky = profoundSkyEst(image, mask=profound$objects_redo, cutlo=0, plot=TRUE)
##D magplot(sky$radrun)
##D abline(h=sky$sky)
##D 
##D #Or weighting the sky to outer radii
##D 
##D sky = profoundSkyEst(image, mask=profound$objects, cutlo=0, radweight=1, plot=TRUE)
##D magplot(sky$radrun)
##D abline(h=sky$sky)
##D 
##D #Finally we can leave the central cutlo mask turned on:
##D 
##D sky = profoundSkyEst(image, mask=profound$objects, plot=TRUE)
##D magplot(sky$radrun)
##D abline(h=sky$sky)
## End(Not run)



