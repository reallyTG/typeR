library(unrepx)


### Name: daniel.paper
### Title: Half-normal graph paper
### Aliases: daniel.paper
### Keywords: design hplot

### ** Examples

require("unrepx")

old.par <- par(mar = c(5, 5, 1, 1) + .1)
daniel.paper(15)

neon_thm <- list(
    major = list(col = "green", lty = 1, lwd = 2),
    minor = list(col = "orange", lty = 1),
    axis = list(col = "magenta", lwd = 2)
)
daniel.paper(31, rank.axis = "x", theme = "neon")

par(old.par)



