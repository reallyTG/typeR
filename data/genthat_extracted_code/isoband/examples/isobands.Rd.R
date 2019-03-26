library(isoband)


### Name: isobands
### Title: Efficient calculation of isolines and isobands from elevation
###   grid
### Aliases: isobands isolines

### ** Examples

library(grid)

#' # one simple connected shape
m <- matrix(c(0, 0, 0, 0, 0, 0,
              0, 0, 0, 1, 1, 0,
              0, 0, 1, 1, 1, 0,
              0, 1, 1, 0, 0, 0,
              0, 0, 0, 1, 0, 0,
              0, 0, 0, 0, 0, 0), 6, 6, byrow = TRUE)

df_bands <- isobands((1:ncol(m))/(ncol(m)+1), (nrow(m):1)/(nrow(m)+1), m, 0.5, 1.5)[[1]]
df_lines <- isolines((1:ncol(m))/(ncol(m)+1), (nrow(m):1)/(nrow(m)+1), m, 0.5)[[1]]
g <- expand.grid(x = (1:ncol(m))/(ncol(m)+1), y = (nrow(m):1)/(nrow(m)+1))
grid.newpage()
grid.points(g$x, g$y, default.units = "npc", pch = 19, size = unit(0.5, "char"))
grid.path(df_bands$x, df_bands$y, df_bands$id, gp = gpar(fill = "cornsilk", col = NA))
grid.polyline(df_lines$x, df_lines$y, df_lines$id)

# a similar plot can be generated with the plot_iso() function,
# which is useful for exploring how the algorithm works
plot_iso(m, 0.5, 1.5)

# NAs are ignored
m <- matrix(c(NA, NA, NA, 0, 0, 0,
              NA, NA, NA, 1, 1, 0,
               0,  0,  1, 1, 1, 0,
               0,  1,  1, 0, 0, 0,
               0,  0,  0, 1, 0, 0,
               0,  0,  0, 0, 0, 0), 6, 6, byrow = TRUE)
plot_iso(m, 0.5, 1.5)

# two separate shapes
m <- matrix(c(0, 0, 1, 1,
              0, 1, 1, 1,
              1, 1, 0, 0,
              0, 0, 0.8, 0), 4, 4, byrow = TRUE)
plot_iso(m, 0.5, 1.5)

# shape with hole
m <- matrix(c(0, 0, 0, 0, 0, 0,
              0, 1, 1, 1, 1, 0,
              0, 1, 2, 2, 1, 0,
              0, 1, 2, 2, 1, 0,
              0, 1, 1, 1, 1, 0,
              0, 0, 0, 0, 0, 0), 6, 6, byrow = TRUE)
plot_iso(m, 0.5, 1.5)



