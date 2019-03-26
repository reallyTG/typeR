library(recexcavAAR)


### Name: posdec
### Title: Multiple point position decision in relation to a set of stacked
###   surfaces (3D)
### Aliases: posdec

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

finds <- data.frame(
  x = c(0, 1, 0.5, 0.7),
  y = c(0.5, 0, 1, 0.7),
  z = c(-10, 10, 0, 2)
)

posdec(finds, maps)




