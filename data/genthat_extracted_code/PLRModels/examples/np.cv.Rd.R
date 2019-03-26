library(PLRModels)


### Name: np.cv
### Title: Cross-validation bandwidth selection in nonparametric regression
###   models
### Aliases: np.cv
### Keywords: Statistical Inference Regression Time Series Nonparametric
###   Statistics

### ** Examples

# EXAMPLE 1: REAL DATA
data <- matrix(10,120,2)
data(barnacles1)
barnacles1 <- as.matrix(barnacles1)
data[,1] <- barnacles1[,1]
data <- diff(data, 12)
data[,2] <- 1:nrow(data)

aux <- np.cv(data, ln.0=1,step.ln=1, num.ln=2)
aux$h.opt
plot.ts(aux$CV)

par(mfrow=c(2,1))
plot(aux$h.seq,aux$CV[,1], xlab="h", ylab="CV", type="l", main="ln=1")
plot(aux$h.seq,aux$CV[,2], xlab="h", ylab="CV", type="l", main="ln=2")



# EXAMPLE 2: SIMULATED DATA
## Example 2a: independent data

set.seed(1234)
# We generate the data
n <- 100
t <- ((1:n)-0.5)/n
m <- function(t) {0.25*t*(1-t)}
f <- m(t)

epsilon <- rnorm(n, 0, 0.01)
y <-  f + epsilon
data_ind <- matrix(c(y,t),nrow=100)

# We apply the function
a <-np.cv(data_ind)
a$CV.opt

CV <- a$CV
h <- a$h.seq
plot(h,CV,type="l")




