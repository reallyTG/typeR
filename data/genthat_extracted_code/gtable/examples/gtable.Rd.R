library(gtable)


### Name: gtable
### Title: gtable
### Aliases: gtable gtable-package

### ** Examples

library(grid)
a <- gtable(unit(1:3, c("cm")), unit(5, "cm"))
a
gtable_show_layout(a)

# Add a grob:
rect <- rectGrob(gp = gpar(fill = "black"))
a <- gtable_add_grob(a, rect, 1, 1)
a
plot(a)

# gtables behave like matrices:
dim(a)
t(a)
plot(t(a))

# when subsetting, grobs are retained if their extents lie in the
# rows/columns that retained.

b <- gtable(unit(c(2, 2, 2), "cm"), unit(c(2, 2, 2), "cm"))
b <- gtable_add_grob(b, rect, 2, 2)
b[1, ]
b[, 1]
b[2, 2]

# gtable have row and column names
rownames(b) <- 1:3
rownames(b)[2] <- 200
colnames(b) <- letters[1:3]
dimnames(b)



