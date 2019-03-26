library(ProFit)


### Name: profitOpenCLEnv
### Title: Create OpenCL Pointer Object
### Aliases: profitOpenCLEnv
### Keywords: GPU OpenCL

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

magimage(profitMakeModel(modellist=modellist, dim=c(200,200)))

## Not run: 
##D tempCL=profitOpenCLEnv()
##D magimage(profitMakeModel(modellist=modellist, dim=c(200,200), openclenv=tempCL))
## End(Not run)



