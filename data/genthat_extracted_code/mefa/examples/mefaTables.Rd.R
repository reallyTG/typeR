library(mefa)


### Name: mefaTables
### Title: Subsetting and Ordering of Related Data Tables
### Aliases: mefaTables
### Keywords: manip

### ** Examples

x <- matrix(rpois(20,1), 5, 4)
## Note the reverse alphabetical names
rownames(x) <- letters[5:1]
x
f <- data.frame(matrix(rnorm(30), 10, 3))
rownames(f) <- letters[1:10]
f
## Reverse alphabetical names preserved
mefaTables(x, f, 1)
## Now result is the intersect
rownames(f) <- letters[3:12]
mefaTables(x, f, 1, xtab.fixed = FALSE)



