library(gtable)


### Name: gtable_matrix
### Title: Create a gtable from a matrix of grobs.
### Aliases: gtable_matrix

### ** Examples

library(grid)
a <- rectGrob(gp = gpar(fill = "red"))
b <- circleGrob()
c <- linesGrob()

row <- matrix(list(a, b, c), nrow = 1)
col <- matrix(list(a, b, c), ncol = 1)
mat <- matrix(list(a, b, c, nullGrob()), nrow = 2)

gtable_matrix("demo", row, unit(c(1, 1, 1), "null"), unit(1, "null"))
gtable_matrix("demo", col, unit(1, "null"), unit(c(1, 1, 1), "null"))
gtable_matrix("demo", mat, unit(c(1, 1), "null"), unit(c(1, 1), "null"))

# Can specify z ordering
z <- matrix(c(3, 1, 2, 4), nrow = 2)
gtable_matrix("demo", mat, unit(c(1, 1), "null"), unit(c(1, 1), "null"), z = z)



