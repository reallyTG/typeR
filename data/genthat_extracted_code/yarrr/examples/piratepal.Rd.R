library(yarrr)


### Name: piratepal
### Title: piratepal
### Aliases: piratepal
### Keywords: colors

### ** Examples



# Check out the vignette for a full guide

vignette("piratepal", package = "yarrr")

# Show all palettes

piratepal(palette = "all")

# Show some palettes

piratepal(palette = "basel", trans = .5, plot.result = TRUE)


# Using a palette in a scatterplot

nemo.cols <- piratepal(palette = "nemo",  trans = .5)

set.seed(100) # For reproducibility
x <- rnorm(100)
y <- x + rnorm(100)

plot(x = x, y = y, col = nemo.cols,
    pch = 16,
    cex = runif(100, min = 0, max = 2),
    main = "piratepal('nemo', trans = .5)")





