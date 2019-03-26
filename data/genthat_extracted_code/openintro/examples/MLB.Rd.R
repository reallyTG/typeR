library(openintro)


### Name: MLB
### Title: Salary data for Major League Baseball (2010)
### Aliases: MLB
### Keywords: datasets

### ** Examples

data(MLB)

# _____ Basic Histogram _____ #
hist(MLB$salary / 1000, breaks = 15,
    main = "", xlab = "Salary (millions of dollars)", ylab = "",
    axes = FALSE,
    col = "#22558844")
axis(1, seq(0, 40, 10))
axis(2, c(0, 500))
axis(2, seq(100, 400, 100), rep("", 4), tcl = -0.2)

# _____ Histogram on Log Scale _____ #
hist(log(MLB$salary / 1000), breaks=15,
    main = "", xlab = "log(Salary)", ylab = "",
    axes = FALSE, col = "#22558844")
axis(1) #, seq(0, 40, 10))
axis(2, seq(0, 300, 100))

# _____ Box plot of log(salary) against position _____ #
par(las = 1, mar = c(4, 8, 1, 1))
boxPlot(log(MLB$salary / 1000), MLB$position, horiz = TRUE, ylab = "")



