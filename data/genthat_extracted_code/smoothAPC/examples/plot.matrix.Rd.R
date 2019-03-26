library(smoothAPC)


### Name: plot.matrix
### Title: Presents matrix as a heatmap
### Aliases: plot.matrix

### ** Examples

## No test: 

plot(matrix(rnorm(100),10,10), main = "Noise")
plot(matrix(1:100,10,10), c("Dimension 1", "Dimension 2"), main = "Value")

library(demography)
m <- log(fr.mort$rate$female[1:30, 150:160])
plot(m)
plot(m, color.palette = "special")
plot(m, color.palette = rainbow)
## End(No test)



