library(rgl)


### Name: selectpoints3d
### Title: Select points from a scene
### Aliases: selectpoints3d
### Keywords: graphics

### ** Examples

xyz <- cbind(rnorm(20), rnorm(20), rnorm(20))
ids <- plot3d( xyz )

if (interactive()) {
  # Click near a point to select it and put a sphere there.
  # Press ESC to quit...

  # This version returns coordinates
  selectpoints3d(ids["data"], 
     multiple = function(x) {
        spheres3d(x, color = "red", alpha = 0.3, radius = 0.2)
        TRUE
     })

  # This one returns indices
  selectpoints3d(ids["data"], value = FALSE,
     multiple = function(ids) {
        spheres3d(xyz[ids[, "index"], , drop = FALSE], color = "blue", 
                  alpha = 0.3, radius = 0.2)
        TRUE
     })
}



