library(gppm)


### Name: gppm
### Title: Define a Gaussian process panel model
### Aliases: gppm

### ** Examples

# Defintion of a latent growth curve model
## No test: 
data("demoLGCM")
lgcm <- gppm('muI+muS*t','varI+covIS*(t+t#)+varS*t*t#+(t==t#)*sigma',
        demoLGCM,'ID','y')
## End(No test)



