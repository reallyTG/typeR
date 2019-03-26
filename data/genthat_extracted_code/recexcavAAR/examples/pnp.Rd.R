library(recexcavAAR)


### Name: pnp
### Title: Check if a point is within a polygon (2D)
### Aliases: pnp

### ** Examples

df <- data.frame(
  x = c(1,1,2,2),
  y = c(1,2,1,2)
)

pnp(df$x, df$y, 1.5, 1.5)
pnp(df$x, df$y, 2.5, 2.5)

# caution: false-negatives in edge-cases:
pnp(df$x, df$y, 2, 1.5)




