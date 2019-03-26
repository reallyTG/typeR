library(Smisc)


### Name: vertErrorBar
### Title: Draw vertical error bar(s) on a plot
### Aliases: vertErrorBar

### ** Examples

set.seed(343)

# Make a plot of some standard normal observations
x <- 1:9
y <- rnorm(9)

plot(x, y, pch = as.character(1:9), ylim = c(-2, 2) + range(y),
     ylab = "Z", xlab = "Indexes")

# Draw the error bars
vertErrorBar(x, 0.3, center = y, barLength = 2 * 1.96, blankMiddle = 0.25)



