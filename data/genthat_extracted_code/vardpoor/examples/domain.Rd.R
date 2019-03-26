library(vardpoor)


### Name: domain
### Title: Extra variables for domain estimation
### Aliases: domain
### Keywords: survey

### ** Examples


### Example 0

domain(Y = 1, D = "A")


### Example 1

Y1 <- as.matrix(1 : 10)
colnames(Y1) <- "Y1"
D1 <- as.matrix(rep(1, 10))
colnames(D1) <- "D1"
domain(Y = Y1, D = D1)


### Example 2

Y <- matrix(1 : 20, 10, 2)
colnames(Y) <- paste0("Y", 1 : 2)
D <- matrix(rep(1 : 2, each = 5), 10, 1)
colnames(D) <- "D"
domain(Y, D)


### Example 3

Y <- matrix(1 : 20, 10, 2)
colnames(Y) <- paste0("Y", 1 : 2)
D <- matrix(rep(1 : 4, each = 5), 10, 2)
colnames(D) <- paste0("D", 1 : 2)
domain(Y, D)


### Example 4

Y <- matrix(1 : 20, 10, 2)
colnames(Y) <- paste0("Y", 1 : 2)
D <- matrix(c(rep(1 : 2, each = 5), rep(3, 10)), 10, 2)
colnames(D) <- paste0("D", 1 : 2)
domain(Y, D)



