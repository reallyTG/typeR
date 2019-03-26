library(hutilscpp)


### Name: poleInaccessibility
### Title: Find a binary pole of inaccessibility
### Aliases: poleInaccessibility poleInaccessibility2 poleInaccessibility3

### ** Examples

library(data.table)
library(hutils)
# A square with a 10 by 10 square of the northeast corner removed
x <- runif(1e4, 0, 100)
y <- runif(1e4, 0, 100)
DT <- data.table(x, y)
# remove the NE corner
DT_NE <- DT[implies(x > 90, y < 89)]
DT_NE[, poleInaccessibility2(x, y)]
DT_NE[, poleInaccessibility3(x, y)]




