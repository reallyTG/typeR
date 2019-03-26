library(hhh4contacts)


### Name: powerC
### Title: Exponentiate a Matrix via Eigendecomposition
### Aliases: powerC make_powerC

### ** Examples

Cnorm <- contactmatrix(normalize = TRUE)
powerC <- make_powerC(Cnorm)
powerC(1)
powerC(0)
powers <- c(0, 0.5, 1, 2)
Cp <- lapply(powers, powerC)
if (require("gridExtra"))
    grid.arrange(
        grobs = mapply(plotC, C = Cp, main = paste("power =", powers),
                       SIMPLIFY = FALSE),
        nrow = 2, ncol = 2)

## truncation to enforce non-negative entries
powerC(0.2)  # some entries become negative for small powers
powerC0 <- make_powerC(Cnorm, truncate = TRUE)
powerC0(0.2)



