library(seewave)


### Name: resamp
### Title: Resample a time wave
### Aliases: resamp
### Keywords: dplot ts

### ** Examples

data(peewit)
# downsampling
a<-resamp(peewit,f=22050,g=11025)
# oversampling
b<-resamp(peewit,f=22050,g=44100)



