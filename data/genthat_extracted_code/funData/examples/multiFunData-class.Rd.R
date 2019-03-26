library(funData)


### Name: multiFunData-class
### Title: A class for multivariate functional data
### Aliases: multiFunData-class multiFunData multiFunData,ANY-method
###   names,multiFunData-method names<-,multiFunData-method
###   str,multiFunData-method summary,multiFunData-method

### ** Examples

### Creating a multifunData object with 2 observations on the same domain
# Univariate elements
x <- 1:5
f1 <- funData(x, rbind(x, x+1))
f2 <- funData(x,rbind(x^2, sin(x)))
# Basic
m1 <- new("multiFunData", list(f1,f2))
# Using the constructor, passing the elements as list
m2 <- multiFunData(list(f1,f2))
# Using the constructor, passing the elements directly
m3 <- multiFunData(f1,f2)
# Test if all the same
all.equal(m1,m2)
all.equal(m1,m3)
# Display multiFunData object in the console
m3
# Summarize
summary(m3)

### Creating a multifunData object with 2 observations on different domains (both 1D)
# A new element
y <- 1:3
g1 <- funData(y, rbind(3*y, y+4))
# Create the multiFunData object
m4 <- multiFunData(f1,g1)
# Display multiFunData object in the console
m4

### Creating a multifunData object with 2 observations on different domains (1D and 2D)
# A new element
y <- 1:3; z <- 1:4
g2 <- funData(list(y,z), array(rnorm(24), dim = c(2,3,4)))
# Create the multiFunData object
m5 <- multiFunData(f1,g2)
# Display multiFunData object in the console
m5

### A more realistic object
# element 1
x <- seq(0,2*pi, 0.01)
f1 <- funData(x, outer(seq(0.75, 1.25, length.out = 6), sin(x)))
# element 2
y <- seq(-1,1, 0.01); z <- seq(-0.5, 0.5, 0.01)
X2 <- array(NA, c(6, length(y), length(z)))
for(i in 1:6) X2[i,,] <- outer(y, z, function(x,y){sin(i*pi*y)*cos(i*pi*z)})
f2 <- funData(list(y,z), X2)
# MultiFunData Object
m6 <- multiFunData(f1,f2)
# Display multiFunData object in the console for basic information
m6
# Summarize
summary(m6)
# Use the plot function to get an impression of the data
## Not run: plot(m6) # m6 has 2D element, must specify one observation for plotting
plot(m6, obs = 1, main = c("1st element (obs 1)", "2nd element (obs 1)"))
plot(m6, obs = 6, main = c("1st element (obs 6)", "2nd element (obs 6)"))



