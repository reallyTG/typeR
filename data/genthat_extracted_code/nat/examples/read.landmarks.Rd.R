library(nat)


### Name: read.landmarks
### Title: Generic functions to read/write landmarks in any supported
###   format
### Aliases: read.landmarks write.landmarks

### ** Examples

## Listing of supported fileformats for landmarks
fileformats(class = 'landmarks', rval = "info")

## round trip tests
m=matrix(rnorm(6), ncol=3)
rownames(m)=c("nose", "ear")
f=write.landmarks(m, file='knee', format='cmtk')
read.landmarks(f)

# write in amira format which does not support named landmarks
f2=write.landmarks(m, file='knee', format='amira')
read.landmarks(f2)

# clean up
unlink(c(f,f2))



