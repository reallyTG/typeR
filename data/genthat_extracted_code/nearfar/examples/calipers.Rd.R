library(nearfar)


### Name: calipers
### Title: Matching priority function
### Aliases: calipers

### ** Examples

dd = mtcars[1:4, 2:3]
cc = calipers(distmat=smahal(dd), variable=dd$cyl, tolerance=0.2)
cc



