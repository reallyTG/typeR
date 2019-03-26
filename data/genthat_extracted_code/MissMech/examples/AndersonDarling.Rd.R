library(MissMech)


### Name: AndersonDarling
### Title: K-Sample Anderson Darling Test
### Aliases: AndersonDarling

### ** Examples

#---- Example 1
set.seed(50)
n1 <- 30
n2 <- 45
n3 <- 60
v1 <- rnorm(n1)
v2 <- runif(n2)
v3 <- rnorm(n3, 2, 3)
AndersonDarling(data = c(v1, v2, v3), number.cases=c(n1, n2, n3))

#---- Example 2
set.seed(50)
n1 <- 30
n2 <- 45
n3 <- 60
v1 <- rt(n1,4)
v2 <- rt(n2,4)
v3 <- rt(n3,4)
AndersonDarling(data=c(v1, v2, v3), number.cases=c(n1, n2, n3))



