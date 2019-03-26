library(wmtsa)


### Name: wavFDP
### Title: Class constructor for block- and time-dependent wavelet-based FD
###   model parameter estimators
### Aliases: wavFDP eda.plot.wavFDP plot.wavFDP print.wavFDP
###   print.summary.wavFDP summary.wavFDP
### Keywords: models

### ** Examples

## create a faux dictionary 
dictionary <- wavDictionary(wavelet="s8",
    dual=FALSE, decimate=FALSE, n.sample=512,
    attr.x=NULL, n.levels=5,
    boundary="periodic", conv=TRUE,
    filters=wavDaubechies("s8"),
    fast=TRUE, is.complex=FALSE)

## construct a faux wavFDP object 
z <- wavFDP(estimator="wlse",
    delta=0.45,
    variance.delta=1.0,
    innovations.variance=1.0,
    delta.range=c(-10.0,10.0),
    dictionary=dictionary,
    levels=c(1,3:4),
    edof.mode=2,
    boundary=list(mode=TRUE,description="unbiased"),
    series=create.signalSeries(fdp045),
    sdf.method="Integration lookup table",
    type="block")

## print the result 
print(z)



