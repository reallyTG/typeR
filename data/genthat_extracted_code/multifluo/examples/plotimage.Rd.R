library(multifluo)


### Name: plotimage
### Title: Plotting an image
### Aliases: plotimage

### ** Examples

data(lifetime)
data(count)
data(gp) 
count.img=plotimage(mat=count,lim=c(0,5000))

# with m
count.img=plotimage(mat=count,lim=c(1000,4000),m=count>1000)
## No test: 
plotimage(mat=lifetime,lim=c(2.8,3.5))
gp.img=plotimage(mat=gp,lim=c(-0.2,0.8))
## End(No test)

#add
## No test: 
resT=plotimage(mat=lifetime,lim=c(2.8,3.5),m=count>1000)
resGP=plotimage(mat=gp,lim=c(2.8,3.5),add=TRUE)
## End(No test)





