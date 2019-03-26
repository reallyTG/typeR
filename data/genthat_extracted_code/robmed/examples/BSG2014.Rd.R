library(robmed)


### Name: BSG2014
### Title: Business simulation game data
### Aliases: BSG2014
### Keywords: datasets

### ** Examples

data("BSG2014")
summary(BSG2014)

## scatterplot matrices for three illustrative mediation analyses

# empirical case 1
x <- "SharedExperience"
y <- "TeamPerformance"
m <- "TMS"
plot(BSG2014[, c(x, y, m)], pch = 21, bg = "black")

# empirical case 2
x <- "ValueDiversity"
y <- "TeamCommitment"
m <- "TaskConflict"
plot(BSG2014[, c(x, y, m)], pch = 21, bg = "black")

# empirical case 3
x <- "ValueDiversity"
y <- "TeamPerformance"
m <- "ProcessConflict"
plot(BSG2014[, c(x, y, m)], pch = 21, bg = "black")



