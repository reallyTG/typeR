library(spatstat)


### Name: lintess
### Title: Tessellation on a Linear Network
### Aliases: lintess
### Keywords: spatial datagen

### ** Examples

   # tessellation consisting of one tile for each existing segment
   ns <- nsegments(simplenet)
   df <- data.frame(seg=1:ns, t0=0, t1=1, tile=letters[1:ns])
   u <- lintess(simplenet, df)
   u
   plot(u)



