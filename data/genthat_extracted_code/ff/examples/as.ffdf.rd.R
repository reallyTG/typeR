library(ff)


### Name: as.ffdf
### Title: Coercing to ffdf and data.frame
### Aliases: as.ffdf as.ffdf.ff_vector as.ffdf.ff_matrix as.ffdf.data.frame
###   as.data.frame.ffdf
### Keywords: IO data

### ** Examples

  d <- data.frame(x=1:26, y=letters, z=Sys.time()+1:26)
  ffd <- as.ffdf(d)
  stopifnot(identical(d, as.data.frame(ffd)))
  rm(ffd); gc()



