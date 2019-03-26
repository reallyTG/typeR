library(PLRModels)


### Name: plrm.cv
### Title: Cross-validation bandwidth selection in PLR models
### Aliases: plrm.cv
### Keywords: Statistical Inference Regression Time Series Nonparametric
###   Statistics

### ** Examples

# EXAMPLE 1: REAL DATA
data(barnacles1)
data <- as.matrix(barnacles1)
data <- diff(data, 12)
data <- cbind(data,1:nrow(data))

aux <- plrm.cv(data, step.ln=1, num.ln=2)
aux$bh.opt
plot.ts(aux$CV[,-2,])

par(mfrow=c(2,1))
plot(aux$b.seq,aux$CV[,-2,1], xlab="h", ylab="CV", type="l", main="ln=0")
plot(aux$b.seq,aux$CV[,-2,2], xlab="h", ylab="CV", type="l", main="ln=1")



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

# We apply the function
a <-plrm.cv(data_ind)
a$CV.opt

CV <- a$CV
h <- a$h.seq
plot(h, CV,type="l")


## Example 2b: dependent data and ln.0 > 0

set.seed(1234)
# We generate the data
x <- matrix(rnorm(200,0,1), nrow=n)
sum <- x%*%beta
epsilon <- arima.sim(list(order = c(1,0,0), ar=0.7), sd = 0.01, n = n)
y <-  sum + f + epsilon
data_dep <- matrix(c(y,x,t),nrow=100)

# We apply the function
a <-plrm.cv(data_dep, ln.0=2)
a$CV.opt

CV <- a$CV
h <- a$h.seq
plot(h, CV,type="l")




