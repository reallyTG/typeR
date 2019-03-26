library(misc3d)


### Name: slices3d
### Title: Interactive Image Slices of 3D or 4D Volume Data
### Aliases: slices3d
### Keywords: hplot

### ** Examples

  #Example 1: View of a mixture of three tri-variate normal densities
  nmix3 <- function(x, y, z, m, s) {
      0.4 * dnorm(x, m, s) * dnorm(y, m, s) * dnorm(z, m, s) +
      0.3 * dnorm(x, -m, s) * dnorm(y, -m, s) * dnorm(z, -m, s) +
      0.3 * dnorm(x, m, s) * dnorm(y, -1.5 * m, s) * dnorm(z, m, s)
  }
  x<-seq(-2, 2, len=40)
  g<-expand.grid(x = x, y = x, z = x)
  v<-array(nmix3(g$x,g$y,g$z, .5,.5), c(40,40,40))
  slices3d(vol1=v, main="View of a mixture of three tri-variate normals", col1=heat.colors(256))

## Not run: 
##D   #Example 2: Put a z-map from fMRI data on top of a structure
##D   #           image. The threshold value of the z-map is 2.
##D   library(AnalyzeFMRI)
##D   temp<-f.read.analyze.volume("standard.img")
##D   z<-f.read.analyze.volume("z-map.img")
##D   slices3d(vol1=temp, vol2=z[,,,1], rlim2=c(2,Inf),col2=heat.colors(20),
##D           main="Regions above threshold values.")
##D   
## End(Not run)



