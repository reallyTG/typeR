library(sirt)


### Name: pcm.conversion
### Title: Conversion of the Parameterization of the Partial Credit Model
### Aliases: pcm.conversion
### Keywords: Partial credit model

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Transformation PCM for data.mg
##D #############################################################################
##D 
##D library(CDM)
##D data(data.mg,package="CDM")
##D dat <- data.mg[ 1:1000, paste0("I",1:11) ]
##D 
##D #*** Model 1: estimate partial credit model in parameterization "PCM"
##D mod1a <- TAM::tam.mml( dat, irtmodel="PCM")
##D # use parameterization "PCM2"
##D mod1b <- TAM::tam.mml( dat, irtmodel="PCM2")
##D summary(mod1a)
##D summary(mod1b)
##D 
##D # convert parameterization of Model 1a into parameterization of Model 1b
##D b <- mod1a$item[, c("AXsi_.Cat1","AXsi_.Cat2","AXsi_.Cat3") ]
##D # compare results
##D pcm.conversion(b)
##D mod1b$xsi
## End(Not run)



