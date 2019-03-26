library(PLRModels)


### Name: plrm.gcv
### Title: Generalized cross-validation bandwidth selection in PLR models
### Aliases: plrm.gcv
### Keywords: Statistical Inference Regression Time Series Nonparametric
###   Statistics

### ** Examples

# EXAMPLE 1: REAL DATA

data(barnacles1)
data <- as.matrix(barnacles1)
data <- diff(data, 12)
data <- cbind(data,1:nrow(data))

aux <- plrm.gcv(data)
aux$bh.opt
plot(aux$b.seq, aux$GCV, xlab="h", ylab="GCV", type="l")



# EXAMPLE 2: SIMULATED DATA
## Example 2a: independent data

set.seed(1234)

# We generate the data
n <- 100
t <- ((1:n)-0.5)/n
beta <- c(0.05, 0.01)
m <- function(t) {0.25*t*(1-t)}
f <- m(t)

x <- matrix(rnorm(200,0,1), nrow=n)
sum <- x%*%beta
epsilon <- rnorm(n, 0, 0.01)
y <-  sum + f + epsilon
data_ind <- matrix(c(y,x,t),nrow=100)

# We obtain the optimal bandwidths
a <-plrm.gcv(data_ind)
a$GCV.opt

GCV <- a$GCV
h <- a$h.seq
plot(h, GCV,type="l")




