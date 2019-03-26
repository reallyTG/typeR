library(mefa4)


### Name: find_max
### Title: Utility functions for factors and compositional data
### Aliases: compare_sets find_max find_min reclass redistribute
### Keywords: manip

### ** Examples

## numeric vector
compare_sets(1:10, 8:15)
## factor with 'zombie' labels
compare_sets(factor(1:10, levels=1:10), factor(8:15, levels=1:15))

(mat <- matrix(rnorm(10*5), 10, 5))
(m <- find_max(mat))
## column indices
as.integer(m$index)
find_min(mat)

map <- cbind(c("a","b","c","d","e","f","g"),
             c("A","B","B","C","D","D","E"))
#x <- factor(sample(map[1:6,1], 100, replace=TRUE), levels=map[,1])
x <- as.factor(sample(map[1:6,1], 100, replace=TRUE))
x[2] <- NA
table(x, reclass(x, map, all = FALSE), useNA="always")
table(x, reclass(x, map, all = TRUE), useNA="always")

map[c(4, 7), 2] <- NA
table(x, reclass(x, map, all = FALSE, allow_NA = TRUE), useNA="always")
table(x, reclass(x, map, all = TRUE, allow_NA = TRUE), useNA="always")

(mat2 <- exp(mat) / rowSums(exp(mat)))
(rmat2 <- redistribute(mat2, source = 1, target = 2:4))
colMeans(mat2)
colMeans(rmat2)
stopifnot(abs(sum(mat2) - sum(rmat2)) < 10^-6)




