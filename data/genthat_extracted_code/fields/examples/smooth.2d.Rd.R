library(fields)


### Name: smooth.2d
### Title: Kernel smoother for irregular 2-d data
### Aliases: smooth.2d
### Keywords: smooth

### ** Examples

# Normal kernel smooth of the precip data with bandwidth of .5 ( degree) 
#  
look<- smooth.2d( RMprecip$y,  x=RMprecip$x, theta=.25)

# finer resolution used in computing the smooth 
look3<-smooth.2d( RMprecip$y, x=RMprecip$x, theta=.25, nrow=256, 
ncol=256,Nwidth=32,
Mwidth=32) 
# if the width arguments were omitted the padding would create a  
# 512X 512 matrix with the data filled in the upper 256X256 part. 
# with a bandwidth of .25 degrees the normal kernel is essentially zero  
# beyond 32 grid points from its center ( about 6 standard deviations) 
#
# take a look:

#set.panel(2,1)
#image( look3, zlim=c(-8,12))
#points( RMprecip$x, pch=".")  
#image( look, zlim =c(-8,12))
#points( RMprecip$x, pch=".")  


# bandwidth changed to .25, exponential kernel   
look2<- smooth.2d( RMprecip$y, x=RMprecip$x, cov.function=Exp.cov,theta=.25)
# 


 



