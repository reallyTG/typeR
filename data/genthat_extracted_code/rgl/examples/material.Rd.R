library(rgl)


### Name: rgl.material
### Title: Generic Appearance setup
### Aliases: rgl.material material3d
### Keywords: dynamic

### ** Examples

save <- material3d("color")
material3d(color = "red")
material3d("color")
material3d(color = save)

# this illustrates the effect of depth_test
x <- c(1:3); xmid <- mean(x)
y <- c(2, 1, 3); ymid <- mean(y)
z <- 1
open3d()
tests <- c("never", "less", "equal", "lequal", "greater", 
                  "notequal", "gequal", "always")
for (i in 1:8) {
  triangles3d(x, y, z + i, col = heat.colors(8)[i])
  texts3d(xmid, ymid, z + i, paste(i, tests[i], sep = ". "), depth_test = tests[i]) 
}
highlevel()  # To trigger display



