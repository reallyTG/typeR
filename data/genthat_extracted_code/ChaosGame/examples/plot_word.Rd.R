library(ChaosGame)


### Name: plot_word
### Title: Plot the 2D fractal containing the chosen word
### Aliases: plot_word

### ** Examples

# function with word as input, constructs the IFSP and runs the chaos game:
# for nice results use, for example, R = 20 and orbit = 3000
A <- plot_word(word = "copula", R = 50, orbit = 100)

# plot without histograms of the marginal distributions
plot(A, pch =19, col = 4, cex = 0.1)


# further examples:

# with rotation
# A <- plot_word(word = "copula", R = 100, orbit = 300, phi = pi/8)
# A <- plot_word(word = "fractal", R = 100, orbit = 300, phi = pi/6)

# (approximately) probability-integral-transformed
# A <- plot_word(word = "copula", R = 100, orbit = 300, phi = pi/8, copula = TRUE)
# A <- plot_word(word = "fractal", R = 100, orbit = 300, phi = pi/6, copula = TRUE)



