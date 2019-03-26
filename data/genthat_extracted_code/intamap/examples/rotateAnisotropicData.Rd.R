library(intamap)


### Name: rotateAnisotropicData
### Title: rotateAnisotropicData
### Aliases: rotateAnisotropicData
### Keywords: spatial

### ** Examples


    library(gstat)
    data(sic2004)
    coordinates(sic.val)=~x+y
    sic.val$value=sic.val$dayx

    anisPar <- estimateAnisotropy(sic.val)
    print(anisPar)  

    rotatedObs <- rotateAnisotropicData(sic.val,anisPar)

    newAnisPar <- estimateAnisotropy(rotatedObs)
    print(newAnisPar)  





