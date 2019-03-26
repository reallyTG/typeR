library(expandFunctions)


### Name: eTrim
### Title: Remove padded rows from matrix X
### Aliases: eTrim

### ** Examples

n <- 10
x <- rnorm(n)    # x vector
X <- eLag(x,0:1) # X matrix
t <- 1:n         # time vector
T <- eLag(t,0:1) # time matrix; the column corresponding
                 # to 0 is the time for each row,
                 # even after trimming
matplot(X,type="l",lty=1)
X <- eTrim(X)
T <- eTrim(T)
matplot(x=T[,1],y=X,type="l",lty=1,
  xlab="Time")



