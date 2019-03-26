library(zipfR)


### Name: lnre.vgc
### Title: Expected Vocabulary Growth Curves of LNRE Model (zipfR)
### Aliases: lnre.vgc
### Keywords: models distribution

### ** Examples


## load Dickens dataset and estimate lnre models
data(Dickens.spc)

zm <- lnre("zm",Dickens.spc)
fzm <- lnre("fzm",Dickens.spc,exact=FALSE)
gigp <- lnre("gigp",Dickens.spc)

## compute expected V and V_1 growth up to 100 million tokens
## in 100 steps of 1 million tokens
zm.vgc <- lnre.vgc(zm,(1:100)*1e6, m.max=1)
fzm.vgc <- lnre.vgc(fzm,(1:100)*1e6, m.max=1)
gigp.vgc <- lnre.vgc(gigp,(1:100)*1e6, m.max=1)

## compare
plot(zm.vgc,fzm.vgc,gigp.vgc,add.m=1,legend=c("ZM","fZM","GIGP"))

## load Italian ultra- prefix data
data(ItaUltra.spc)

## compute zm model
zm <- lnre("zm",ItaUltra.spc)

## compute vgc up to about twice the sample size
## with variance of V
zm.vgc <- lnre.vgc(zm,(1:100)*70, variances=TRUE)

## plot with confidence intervals derived from variance in
## vgc (with larger datasets, ci will typically be almost
## invisible)
plot(zm.vgc)




