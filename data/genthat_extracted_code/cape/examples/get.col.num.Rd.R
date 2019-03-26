library(cape)


### Name: get.col.num
### Title: Use column titles to retrieve column numbers
### Aliases: get.col.num
### Keywords: internal

### ** Examples


mat <- matrix(rnorm(50), ncol = 5)
colnames(mat) <- letters[1:5]
print(mat)
col.num <- get.col.num(mat, c("c", "e"))
print(col.num)

col.num <- get.col.num(mat, c("b", "g"))
print(col.num)




