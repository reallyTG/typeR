library(oaPlots)


### Name: pointsOnBoxplot
### Title: Generic pointsOnBoxplot function. Calls pointsOnBoxplot.default
###   or pointsOnBoxplot.formula
### Aliases: pointsOnBoxplot

### ** Examples

# Examples run in the formula and default methods
x2 <- runif(50, 0, 10);
table(customRound(x2, roundTo = 0.5))
boxplot(x2)
pointsOnBoxplot(x2, pch = 19, roundTo = 0.5)

# Set up input data
x <- c(sample(1:5, size = 25, replace = TRUE), rpois(25, lambda = 4))
colVec <- c(rep("olivedrab", 10), rep("red", 5), rep("goldenrod", 15),
    rep("red", 15), rep("olivedrab", 5))
y <- rep(c("Awesome Rats", "Stupid Rats"), each = 25)
y2 <- rep(c("Open", "Analytics"), 25)

x2 <- c(1, 2, 2, 3, 3, 1, 1, 1, 4, 5)
y3 <- c(rep("A", 5), rep("B", 5))
levels(y3) <- c("A", "B", "C")

boxplot(x ~ y, horizontal = TRUE)
pointsOnBoxplot(x ~ y, horizontal = TRUE)

boxplot(x ~ y)
pointsOnBoxplot(x = x, y = y, col = colVec, pch = 19, cex = 2)

boxplot(x ~ y + y2)
pointsOnBoxplot(x ~ y + y2, col = colVec, pch = 19, cex = 2)



