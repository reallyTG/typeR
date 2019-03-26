context("Tests of drawing functions")

circle <- draw_circle(
  centerx = 0, centery = 0, centerz = 0,
  radius = 25, resolution = 200
)

rotatedcircle <- rotate(
  x = circle$x, y = circle$y, z = circle$z,
  degrx = 45
)

# library(rgl)
# plot3d(rotatedcircle)

sphere <- draw_sphere(
  centerx = 0, centery = 0, centerz = 0,
  radius = 2, phires = 20, thetares = 20
)

scaledsphere <- rescale(
  sphere$x, sphere$y, sphere$z,
  scalex = 10, scaley = 10, scalez = 10
)

# plot3d(scaledsphere, add = TRUE)

test_that(
  "the output of all the drawing functions are data.frames",  {
    expect_true(
      all(
        is.data.frame(circle),
        is.data.frame(rotatedcircle),
        is.data.frame(sphere),
        is.data.frame(scaledsphere)
      )
    )
  }
)

test_that(
  "the output data.frames of all the drawing functions
  have the correct colnames and amount of columns",  {
    expect_equal(
      colnames(circle),
      c("x", "y", "z")
    )
    expect_equal(
      colnames(rotatedcircle),
      c("x", "y", "z")
    )
    expect_equal(
      colnames(sphere),
      c("x", "y", "z")
    )
    expect_equal(
      colnames(scaledsphere),
      c("x", "y", "z")
    )
  }
)