library(seewave)


### Name: deletew
### Title: Delete a section of a time wave
### Aliases: deletew
### Keywords: dplot ts

### ** Examples

# deletion a 0.4 s section in a bird song
data(tico)
a<-deletew(tico,f=22050,from=0.5,to=0.9)
oscillo(a,22050)
# a direct way to see what has been cut
deletew(tico,f=22050,from=0.5,to=0.9,plot=TRUE)



