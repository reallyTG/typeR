library(fanovaGraph)


### Name: simAdditive
### Title: Simulate GP values from block-addtive kernel
### Aliases: simAdditive

### ** Examples

### 2 dimensional simulation
x1 <- x2 <- seq(-1,1,,20)
x <- expand.grid(x1,x2)
covtype <- "matern3_2"
mu <- 0

op <- par(no.readonly=TRUE); par(mfrow=c(1,2), mar=c(1,1,1,1))
# non-additive simulation
parameter <- list(list(alpha=1, theta=c(0.8,0.8)))
cl <- list(1:2)
set.seed(1)
y <- simAdditive(x, mu, parameter, covtype, cl)
persp(x1,x2, matrix(y,20), theta=-40, col="lightblue", zlab="y")

# additive simulation
parameter <- list(list(alpha=0.5, theta=0.8),
                  list(alpha=0.5, theta=0.8))
cl <- list(1,2)
set.seed(1)
y <- simAdditive(x, mu, parameter, covtype, cl)
persp(x1,x2, matrix(y,20), theta=-40, col="lightblue", zlab="y")

par(op)



