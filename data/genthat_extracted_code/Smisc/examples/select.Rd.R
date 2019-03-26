library(Smisc)


### Name: select
### Title: Select rows or columns from data frames or matrices while always
###   returning a data frame or a matrix
### Aliases: select

### ** Examples

# Consider this data frame
d <- data.frame(a = 1:5, b = rnorm(5), c = letters[1:5], d = factor(6:10),
                row.names = LETTERS[1:5], stringsAsFactors = FALSE)

# We get identical behavior when selecting more than one column
d1 <- d[, c("d", "c")]
d1c <- select(d, c("d", "c"))
d1
d1c
identical(d1, d1c)

# Different behavior when selecting a single column
d[,"a"]
select(d, "a")

# We can also select using numeric indexes
select(d, 1)

# Selecting a single row from a data frame produces results identical to default R behavior
d2 <- d[2,]
d2c <- select(d, "B", cols = FALSE)
identical(d2, d2c)

# Now consider a matrix
m <- matrix(rnorm(20), nrow = 4, dimnames = list(LETTERS[1:4], letters[1:5]))

# Column selection with two or more or more columns is equivalent to default R behavior
m1 <- m[,c(4, 3)]
m1c <- select(m, c("d", "c"))
m1
m1c
identical(m1, m1c)

# Selecting a single column returns a matrix of 1 column instead of a vector
m[,2]
select(m, 2)

# Selecting a single row returns a matrix of 1 row instead of a vector
m2 <- m["C",]
m2c <- select(m, "C", cols = FALSE)
m2
m2c
is.matrix(m2)
is.matrix(m2c)

# Selecting no rows or no columns occurs if 0 or an object of length 0
# is passed to 'selection'
select(d, 0)
select(d, which("bizarre" %in% colnames(d)))
select(d, 0, cols = FALSE)



