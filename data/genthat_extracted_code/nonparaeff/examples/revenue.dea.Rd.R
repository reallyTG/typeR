library(nonparaeff)


### Name: revenue.dea
### Title: Linear Programming for Revenue Maximization
### Aliases: revenue.dea
### Keywords: Data Envelopment Analysis

### ** Examples

tab8.3 <- data.frame(y1 = c(1, 3, 6, 6, 3, 9),
                          y2 = c(6, 6, 3, 5, 4, 1),
                          x = c(1, 1, 1, 1, 1, 1))
tab8.3.ps.f <- c(p1 = 2, p2 = 2)
(ex8.3 <- revenue.dea(base = tab8.3,
                    noutput = 2, output.price = tab8.3.ps.f))



