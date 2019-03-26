library(zipfR)


### Name: lnre.spc
### Title: Compute Expected Frequency Spectrum of LNRE Model (zipfR)
### Aliases: lnre.spc
### Keywords: models distribution

### ** Examples


## load Dickens dataset and compute lnre models
data(Dickens.spc)

zm <- lnre("zm",Dickens.spc)
fzm <- lnre("fzm",Dickens.spc, exact=FALSE)
gigp <- lnre("gigp",Dickens.spc)

## calculate the corresponding expected
## frequency spectra at the Dickens size
zm.spc <- lnre.spc(zm,N(Dickens.spc))
fzm.spc <- lnre.spc(fzm,N(Dickens.spc))
gigp.spc <- lnre.spc(gigp,N(Dickens.spc))

## comparative plot
plot(Dickens.spc,zm.spc,fzm.spc,gigp.spc,m.max=10)

## expected spectra at N=100e+8
## and comparative plot
zm.spc <- lnre.spc(zm,1e+8)
fzm.spc <- lnre.spc(fzm,1e+8)
gigp.spc <- lnre.spc(gigp,1e+8)

plot(zm.spc,fzm.spc,gigp.spc,m.max=10)

## with variances
zm.spc <- lnre.spc(zm,1e+8,variances=TRUE)
head(zm.spc)

## asking for more than 50 spectrum elements
## (increasing m.max will eventually lead
## to error, at different threshold for
## the different models)
zm.spc <- lnre.spc(zm,1e+8,m.max=1000)
fzm.spc <- lnre.spc(fzm,1e+8,m.max=1000)
gigp.spc <- lnre.spc(gigp,1e+8,m.max=100) ## gigp breaks first!





