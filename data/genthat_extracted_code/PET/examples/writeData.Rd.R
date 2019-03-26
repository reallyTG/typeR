library(PET)


### Name: writeData
### Title: Write Datasets in different Formats
### Aliases: writeData
### Keywords: IO file

### ** Examples

## Not run: 
##D P <- phantom(addIm="blurred1")
##D rP <- radon(P, RhoSamples=401)
##D irP <- iradon(rP$rData, 257, 257)
##D # Saving 'P' as a 'jpeg'-file
##D writeData(P, "Phantom.jpeg")
##D # Saving 'rP' as a 'pet'-file
##D writeData(rP$rData, "RadonPhantom.pet", fileHeader=rP$Header)
##D # Saving 'irP' as a 'dat.gz'-file'
##D writeData(irP$irData, "RecPhantom.dat.gz", fileHeader=irP$Header)
##D rm(irP,P,rP)
##D 
##D Image1 <- readData("Phantom.jpeg")
##D Image2 <- readData("RadonPhantom.pet")
##D Image3 <- readData("RecPhantom.dat.gz")
##D viewData(list(Image1,Image2$Signal,Image3$Signal))
##D rm(Image1,Image2,Image3)
## End(Not run)




