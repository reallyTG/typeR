library(imager)


### Name: watershed
### Title: Compute watershed transform.
### Aliases: watershed

### ** Examples

#In our initial image we'll place three seeds 
#(non-zero pixels) at various locations, with values 1, 2 and 3. 
#We'll use the watershed algorithm to propagate these values
imd <- function(x,y) imdirac(c(100,100,1,1),x,y)
im <- imd(20,20)+2*imd(40,40)+3*imd(80,80)
layout(t(1:3))
plot(im,main="Seed image")
#Now we build an priority map: neighbours of our seeds 
#should get high priority. 
#We'll use a distance map for that
p <- 1-distance_transform(sign(im),1) 
plot(p,main="Priority map")
watershed(im,p) %>% plot(main="Watershed transform")



