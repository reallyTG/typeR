library(nat.utils)


### Name: is.gzip
### Title: Check if a file is a gzip file
### Aliases: is.gzip

### ** Examples

notgzipfile=tempfile()
writeLines('not a gzip', notgzipfile)
is.gzip(notgzipfile)
con=gzfile(gzipfile<-tempfile(),open='wt')
writeLines('This one is gzipped', con)
close(con)
is.gzip(gzipfile)
unlink(c(notgzipfile,gzipfile))



