library(archetypes)


### Name: simplexplot
### Title: Simplex visualization
### Aliases: simplexplot

### ** Examples

### This example reproduces parts of the Figure 7 shown in
  ### "Probabilistic Archetypal Analysis" by Seth and Eugster (2014)

  data("toy", package = "archetypes")

  set.seed(1234); a3 <- archetypes(toy, k = 3)
  set.seed(1237); a4 <- archetypes(toy, k = 4)
  set.seed(1238); a5 <- archetypes(toy, k = 5)

  simplexplot(a3)
  simplexplot(a3, show_direction = TRUE, show_points = FALSE)
  simplexplot(a4, projection = tspsimplex_projection)
  simplexplot(a5, show_direction = TRUE, show_points = FALSE,
    direction_length = 2, directions_col = "black")



