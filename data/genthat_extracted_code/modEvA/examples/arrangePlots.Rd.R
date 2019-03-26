library(modEvA)


### Name: arrangePlots
### Title: Arrange plots
### Aliases: arrangePlots

### ** Examples

arrangePlots(10)

arrangePlots(10, landscape = TRUE)


# a more practical example:

data(iris)

names(iris)

# say you want to plot all columns in a nicely arranged plotting window:

par(mfrow = arrangePlots(ncol(iris)))

for (i in 1:ncol(iris)) {
  plot(1:nrow(iris), iris[, i])
}



