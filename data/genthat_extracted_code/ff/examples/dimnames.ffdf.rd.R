library(ff)


### Name: dimnames.ffdf
### Title: Getting and setting dimnames of ffdf
### Aliases: dimnames.ffdf dimnames<-.ffdf names.ffdf names<-.ffdf
###   row.names.ffdf row.names<-.ffdf

### ** Examples

  ffd <- as.ffdf(data.frame(a=1:26, b=letters))
  dimnames(ffd)
  row.names(ffd) <- letters
  dimnames(ffd)
  ffd
  rm(ffd); gc()



