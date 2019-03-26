library(rgl)


### Name: writeASY
### Title: Write Asymptote code for an rgl scene
### Aliases: writeASY

### ** Examples

x <- rnorm(20)
y <- rnorm(20)
z <- rnorm(20)
plot3d(x, y, z, type = "s", col = "red")
olddir <- setwd(tempdir())
writeASY(title = "interactive")  # Produces interactive.pdf
writeASY(title = "noninteractive", prc = FALSE) # Produces noninteractive.pdf
setwd(olddir)



