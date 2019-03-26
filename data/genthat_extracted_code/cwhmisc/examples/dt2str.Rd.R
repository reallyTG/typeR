library(cwhmisc)


### Name: dt2str
### Title: Convert time difference to string.
### Aliases: dt2str
### Keywords: chron

### ** Examples

  t1 <- unclass(Sys.time())
  x <- 0;  for (i in 1:1.e6) x <- x+1
  t2 <- unclass(Sys.time())
  dt2str(t2-t1,3) # 00:00:0.070, Macbook Pro 2016, 2.2 GHz, 16GB RAM



