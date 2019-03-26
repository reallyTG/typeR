library(seewave)


### Name: cutw
### Title: Cut a section of a time wave
### Aliases: cutw
### Keywords: dplot ts

### ** Examples

# a 0.4 s section in a bird song
data(tico)
a<-cutw(tico,f=22050,from=0.5,to=0.9)
oscillo(a,22050)
# a direct way to see what has been cut
cutw(tico,f=22050,from=0.5,to=0.9,plot=TRUE)



