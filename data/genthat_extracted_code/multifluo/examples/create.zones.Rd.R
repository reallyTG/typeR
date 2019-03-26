library(multifluo)


### Name: create.zones
### Title: Creating a list of consecutive zones of images
### Aliases: create.zones

### ** Examples

data(zone.mat)
zones=create.zones(pts=zone.mat,shape="para",interact=FALSE)
data(count)
## No test: 
img=plotimage(count,lim=c(1000,4000),m=count>1000)
zonesRect=create.zones(img,shape="rect",n.zones=3)
zonesPara=create.zones(img,shape="para",n.zones=3)
zonesCircle=create.zones(img,shape="circle",n.zones=3)
zonesVarious=create.zones(img,shape="various",n.zones=3)
## End(No test)




