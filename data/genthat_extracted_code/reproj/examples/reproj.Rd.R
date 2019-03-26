library(reproj)


### Name: reproj
### Title: Reproject coordinates.
### Aliases: reproj reproj.matrix reproj.data.frame

### ** Examples

reproj(cbind(147, -42), target = "+proj=laea +datum=WGS84", 
                         source = "+proj=longlat +datum=WGS84")



