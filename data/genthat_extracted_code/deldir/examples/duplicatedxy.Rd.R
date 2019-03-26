library(deldir)


### Name: duplicatedxy
### Title: Determine duplicated points.
### Aliases: duplicatedxy
### Keywords: utilities

### ** Examples

   set.seed(42)
   xy  <- data.frame(x=runif(20),y=runif(20))
   # Lots of duplicated points.
   xy  <- rbind(xy,xy[sample(1:20,20,TRUE),])
   # Scramble.
   ii  <- sample(1:40,40)
   x   <- xy$x[ii]
   y   <- xy$y[ii]
   # Unduplicate!
   iii <- !duplicatedxy(x,y)
   xu  <- x[iii]
   yu  <- y[iii]
   # The i-th tile is determined by (xu[i],yu[i]):
   dxy <- deldir(xu,yu)



