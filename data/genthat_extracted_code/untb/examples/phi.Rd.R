library(untb)


### Name: phi
### Title: Hubbell's phi
### Aliases: phi unphi
### Keywords: math

### ** Examples


jj <- c(rep("oak",5) ,rep("ash",2),rep("elm",3),"pine","tea","yew")
a <- as.count(jj)

phi(a)
unphi(phi(a))   #should match 'a' except for species names (which are lost)

data(butterflies)
phi(butterflies,add=FALSE)

summary(unphi(phi(butterflies)))  #should match 'summary(butterflies)'




