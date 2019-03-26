library(funData)


### Name: plot.multiFunData
### Title: Plotting multivariate functional data
### Aliases: plot.multiFunData plot,multiFunData,missing-method

### ** Examples

oldpar <- par(no.readonly = TRUE)
argvals <- seq(0, 2*pi, 0.1)

# One-dimensional elements
f1 <- funData(argvals, outer(seq(0.75, 1.25, length.out = 11), sin(argvals)))
f2 <- funData(argvals, outer(seq(0.75, 1.25, length.out = 11), cos(argvals)))

m1 <- multiFunData(f1, f2)
plot(m1, main = c("1st element", "2nd element")) # different titles
plot(m1, main = "Multivariate Functional Data") # one title for all

# Mixed-dimensional elements
X <- array(0, dim = c(11, length(argvals), length(argvals)))
X[1,,] <- outer(argvals, argvals, function(x,y){sin((x-pi)^2 + (y-pi)^2)})
g <- funData(list(argvals, argvals), X)

m2 <- multiFunData(f1, g)
# different titles and labels
plot(m2, main = c("1st element", "2nd element"), obs = 1,
     xlab = c("xlab1", "xlab2"), 
     ylab = "one ylab for all")
# one title for all
plot(m2, main = "Multivariate Functional Data", obs = 1) 

## Not run: plot(m2, main = c("1st element", "2nd element")) # must specify obs!

par(oldpar)



