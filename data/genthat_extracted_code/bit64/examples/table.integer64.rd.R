library(bit64)


### Name: table.integer64
### Title: Cross Tabulation and Table Creation for integer64
### Aliases: table.integer64
### Keywords: category

### ** Examples

message("pure integer64 examples")
x <- as.integer64(sample(c(rep(NA, 9), 1:9), 32, TRUE))
y <- as.integer64(sample(c(rep(NA, 9), 1:9), 32, TRUE))
z <- sample(c(rep(NA, 9), letters), 32, TRUE)
table.integer64(x)
table.integer64(x, order="counts")
table.integer64(x, y)
table.integer64(x, y, return="data.frame")

message("via as.integer64.factor we can use 'table.integer64' also for factors")
table.integer64(x, as.integer64(as.factor(z)))

message("via as.factor.integer64 we can also use 'table' for integer64")
table(x)
table(x, exclude=NULL)
table(x, z, exclude=NULL)

## Don't show: 
 stopifnot(identical(table.integer64(as.integer64(c(1,1,2))), table(c(1,1,2))))
 stopifnot(identical(table.integer64(as.integer64(c(1,1,2)),as.integer64(c(3,4,4))), table(c(1,1,2),c(3,4,4))))
 message("the following works with three warnings due to coercion")
 stopifnot(identical(table.integer64(c(1,1,2)), table(c(1,1,2))))
 stopifnot(identical(table.integer64(as.integer64(c(1,1,2)),c(3,4,4)), table(c(1,1,2),c(3,4,4))))
 stopifnot(identical(table.integer64(c(1,1,2),as.integer64(c(3,4,4))), table(c(1,1,2),c(3,4,4))))
 message("the following works because of as.factor.integer64")
 stopifnot(identical(table(as.integer64(c(1,1,2))), table(c(1,1,2))))  
 stopifnot(identical(table(as.integer64(c(1,1,2)),as.integer64(c(3,4,4))), table(c(1,1,2),c(3,4,4))))
 stopifnot(identical(table(as.integer64(c(1,1,2)),c(3,4,4)), table(c(1,1,2),c(3,4,4))))
 stopifnot(identical(table(c(1,1,2),as.integer64(c(3,4,4))), table(c(1,1,2),c(3,4,4))))
## End(Don't show)




