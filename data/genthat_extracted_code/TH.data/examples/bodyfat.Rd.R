library(TH.data)


### Name: bodyfat
### Title: Prediction of Body Fat by Skinfold Thickness, Circumferences,
###   and Bone Breadths
### Aliases: bodyfat
### Keywords: datasets

### ** Examples


    data("bodyfat", package = "TH.data")

    ### final model proposed by Garcia et al. (2005)
    fmod <- lm(DEXfat ~ hipcirc + anthro3a + kneebreadth, data = bodyfat)
    coef(fmod)




