library(xtractomatic)


### Name: xtracto_3D
### Title: Extract environmental data in a 3-D bounding box using ERDDAP.
### Aliases: xtracto_3D

### ** Examples

xpos <- c(-130., -125.)
ypos <- c(30., 35.)
tpos <- c('2015-01-16', '2015-02-16')
extract <- xtracto_3D('mhsstdmday', xpos, ypos, tpos = tpos)
## No test: 
xpos <- c(230, 231)
ypos <- c(40, 41)
tpos <- c('2006-05-05', '2006-05-06')
extract <- xtracto_3D('erdMBsstd8day', xpos, ypos, tpos = tpos, verbose=TRUE)
## End(No test)



