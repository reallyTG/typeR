library(ProFit)


### Name: profitDeprojectImageEllipse
### Title: Deproject an image along an ellipse's minor axis
### Aliases: profitDeprojectImageEllipse
### Keywords: deproject ellipse disk disc

### ** Examples

## Not run: 
##D disk = profitMakeModel(modellist=list(sersic=list(xcen=50,ycen=50,mag=15,re=5,nser=1,
##D axrat=0.5,ang=125,box=0)))
##D magimage(log10(disk$z), zlim=c(-15,-7.5),magmap=FALSE)
##D 
##D deproj = profitDeprojectImageEllipse(disk$z, xcen=50, ycen=50, axrat=0.5, ang=125,
##D upsample = 9L)
##D magimage(log10(deproj$img), zlim=c(-15,-7.5),magmap=FALSE)
## End(Not run)



