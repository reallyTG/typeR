library(marmap)


### Name: antimeridian.box
### Title: Adds a box to maps including antimeridian
### Aliases: antimeridian.box

### ** Examples

data(aleutians)

# default plot:
plot(aleutians,n=1)

# plot with corrected box and labels:
plot(aleutians,n=1,axes=FALSE)
antimeridian.box(aleutians, 10)



