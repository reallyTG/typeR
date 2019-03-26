library(reporttools)


### Name: displayCI
### Title: Generate strings of a confidence interval from a matrix
### Aliases: displayCI
### Keywords: manip character

### ** Examples

a <- 0.05
k <- qnorm(p = 1 - a / 2)
x <- 50
n <- 100
wilson.ci <- (x + k ^ 2 / 2) / (n + k ^ 2) + c(-1, 1) * (k * n ^ 0.5) / 
    (n + k ^ 2) * sqrt(x / n * (1 - x / n) + k ^ 2 / (4 * n))
displayCI(wilson.ci)
displayCI(wilson.ci, digit = 1, unit = "cm", text = "none")
displayCI(wilson.ci, digit = 1, unit = "cm", text = "english")



