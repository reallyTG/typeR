library(furniture)


### Name: long
### Title: Wide to Long Data Reshaping
### Aliases: long

### ** Examples


x1 <- runif(1000)
x2 <- runif(1000)
x3 <- runif(1000)
y1 <- rnorm(1000)
y2 <- rnorm(1000)
z  <- factor(sample(c(0,1), 1000, replace=TRUE))
a  <- factor(sample(c(1,2), 1000, replace=TRUE))
b  <- factor(sample(c(1,2,3,4), 1000, replace=TRUE))
df  <- data.frame(x1, x2, x3, y1, y2, z, a, b)

## "Balanced" Data
ldf1 <- long(df, 
             c("x1", "x2"), c("y1", "y2"),
             v.names = c("x", "y"))

## "Unbalanced" Data
ldf2 = long(df, 
            c("x1", "x2", "x3"), c("y1", "y2", "miss"),
            v.names = c("x", "y"))





