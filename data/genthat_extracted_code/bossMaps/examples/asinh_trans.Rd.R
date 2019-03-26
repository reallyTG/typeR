library(bossMaps)


### Name: asinh_trans
### Title: Create an axis transform using the Inverse hyperbolic sine
###   transformation
### Aliases: asinh_trans

### ** Examples

  
 library(ggplot2)
 ggplot(data.frame(x=seq(-1000,1000,len=200)), aes(x=x,y=x))+
 geom_line(size=1)+
 scale_x_continuous(trans = 'asinh',breaks=c(-1000,-100,10,-1,0,1,10,100,1000))



