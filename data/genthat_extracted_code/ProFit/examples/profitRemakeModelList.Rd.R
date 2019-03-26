library(ProFit)


### Name: profitRemakeModellist
### Title: Reconstruct an Image Model
### Aliases: profitRemakeModellist
### Keywords: relist

### ** Examples

modellist = list(
  sersic = list(
    xcen   = c(50, 50),
    ycen   = c(50, 50),
    mag = c(15, 13),
    re  = c(14, 5),
    nser  = c(3, 10),
    ang  = c(46, 80),
    axrat  = c(0.4, 0.6),
    box = c(0,-0.5)
  )
)

magimage(profitMakeModel(modellist))

tofit = list(
  sersic = list(
    xcen   = c(TRUE, NA),
    ycen   = c(TRUE, NA),
    mag = c(TRUE, FALSE),
    re  = c(TRUE, FALSE),
    nser  = c(TRUE, TRUE),
    ang  = c(FALSE, FALSE),
    axrat  = c(TRUE, FALSE),
    box = c(FALSE, FALSE)
  )
)

parm=c(55,55,12,20,1,4,0.8)

magimage(profitMakeModel(profitRemakeModellist(parm, modellist, tofit)$modellist))



