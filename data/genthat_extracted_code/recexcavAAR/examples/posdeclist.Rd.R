library(recexcavAAR)


### Name: posdeclist
### Title: Multiple point position decision in relation to a set of stacked
###   surfaces (3D) for multiple data.frames in a list
### Aliases: posdeclist

### ** Examples

df1 <- data.frame(
  x = rnorm(50),
  y = rnorm(50),
  z = rnorm(50) - 5
)

df2 <- data.frame(
  x = rnorm(50),
  y = rnorm(50),
  z = rnorm(50) + 5
)

lpoints <- list(df1, df2)

maps <- kriglist(lpoints, lags = 3, model = "spherical")

hexadf1 <- data.frame(
  x = c(0, 1, 0, 4, 5, 5, 5, 5),
  y = c(1, 1, 4, 4, 1, 1, 4, 4),
  z = c(1, 5, 1, 6, 1, 5, 1, 3)
)

hexadf2 <- data.frame(
  x = c(0, 1, 0, 4, 5, 5, 5, 5),
  y = c(1, 1, 4, 4, 1, 1, 4, 4),
  z = c(-1, -5, -1, -6, -1, -5, -1, -3)
)

cx1 <- fillhexa(hexadf1, 0.1)
cx2 <- fillhexa(hexadf2, 0.1)

cubelist <- list(cx1, cx2)

posdeclist(cubelist, maps)




