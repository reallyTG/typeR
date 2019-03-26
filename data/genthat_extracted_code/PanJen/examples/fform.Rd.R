library(PanJen)


### Name: fform
### Title: Compare a number of transformations with a semiparametric
###   smoothing and a model without the variable
### Aliases: fform

### ** Examples

library(PanJen) 
data("hvidovre")

form<-formula(lprice ~brick+roof_tile+roof_cemen+rebuild70+rebuild80+rebuild90+rebuild00+y7+y8+y9) 
PanJenArea<-fform(data=hvidovre,variable="area",base_form=form) 



