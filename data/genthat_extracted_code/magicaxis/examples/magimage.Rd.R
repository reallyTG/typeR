library(magicaxis)


### Name: magimage
### Title: Magically pretty images
### Aliases: magimage magimageRGB
### Keywords: image

### ** Examples

#Basic
magimage(matrix(1:9,3))

#Mid pixel versus pixel edge:
magimage(3:0,1:3,matrix(1:9,3))

#Standard scaling is not very useful in this instance:
magimage(matrix(10^(1:9),3))
#Linear scaling is not very useful in this instance, though it does now map from [0,1]:
magimage(matrix(10^(1:9),3),magmap=TRUE,zlim=c(0,0.5))
#Log scaling with magmap makes it much clearer:
magimage(matrix(10^(1:9),3),magmap=TRUE,stretch='log')
#And it's easy just to show the lowest half now:
magimage(matrix(10^(1:9),3),magmap=TRUE,stretch='log',zlim=c(0,0.5))



