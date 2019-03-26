library(dagitty)


### Name: vanishingTetrads
### Title: List Implied Vanishing Tetrads
### Aliases: vanishingTetrads

### ** Examples

# Specify two-factor model with 4 indicators each
g <- dagitty("dag{{x1 x2 x3 x4} <- x <-> y -> {y1 y2 y3 y4}}")
latents(g) <- c("x","y")

# Check how many tetrads are implied
nrow(vanishingTetrads(g))
# Check how these distribute across the typology
nrow(vanishingTetrads(g,"within"))
nrow(vanishingTetrads(g,"between"))
nrow(vanishingTetrads(g,"epistemic"))




