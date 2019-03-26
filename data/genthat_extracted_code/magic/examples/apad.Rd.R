library(magic)


### Name: apad
### Title: Pad arrays
### Aliases: apad
### Keywords: array

### ** Examples


apad(1:10,4,method="mirror")


a <- matrix(1:30,5,6)

apad(a,c(4,4))
apad(a,c(4,4),post=FALSE)

apad(a,1,5)

apad(a,c(5,6),method="mirror")
apad(a,c(5,6),method="mirror",post=FALSE)



