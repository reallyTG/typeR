library(imager)


### Name: iiply
### Title: Split an image, apply function, recombine the results as an
###   image
### Aliases: iiply

### ** Examples

##' #Normalise colour channels separately, recombine
iiply(boats,"c",function(v) (v-mean(v))/sd(v)) %>% plot 




