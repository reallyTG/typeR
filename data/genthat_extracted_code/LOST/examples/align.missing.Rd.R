library(LOST)


### Name: align.missing
### Title: Procrustes superimposition of landmark datasets with some
###   missing values
### Aliases: align.missing

### ** Examples


data(dacrya)

## make some specimens incomplete
dac.miss<-missing.specimens(dacrya,10,c(1,2,3,4,5,6),16)
dac.miss

## align all specimens
dac.aligned<-align.missing(dac.miss,16)

## compare original and aligned
plot(dacrya,col="blue")
points(dac.aligned,col="red")



