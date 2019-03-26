library(imager)


### Name: bucketfill
### Title: Bucket fill
### Aliases: bucketfill

### ** Examples

#Change the colour of a sail 
boats.new <- bucketfill(boats,x=169,y=179,color="pink",sigma=.2) 
layout(t(1:2))
plot(boats,main="Original")
plot(boats.new,main="New sails")

#More spreading, lower opacity, colour specified as vector
ugly <- bucketfill(boats,x=169,y=179,color=c(0,1,0),sigma=.6,opacity=.5)
plot(ugly)



