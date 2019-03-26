library(BaBooN)


### Name: BBPMM.row
### Title: (Multiple) Imputation of variable vectors
### Aliases: BBPMM.row BBPMMrow
### Keywords: robust datagen

### ** Examples


### sample data set with non-normal variables and a single
### missingness pattern
set.seed(1000)
n <- 50
x1 <- round(runif(n,0.5,3.5))
x2 <- as.factor(c(rep(1,10),rep(2,25),rep(3,15)))
x3 <- round(rnorm(n,0,3))
y1 <- round(x1-0.25*(x2==2)+0.5*x3+rnorm(n,0,1))
y1 <- ifelse(y1<1,1,y1)
y1 <- ifelse(y1>4,5,y1)
y2 <- y1+rnorm(n,0,0.5)
y3 <- round(x3+rnorm(n,0,2))
data <- as.data.frame(cbind(x1,x2,x3,y1,y2,y3))
misrow1 <- sample(n,20)
data[misrow1, c(4:6)] <- NA

### preparation step
impblock <- rowimpPrep(data)

### imputation
imputed.data <- BBPMM.row(impblock, M=5)





