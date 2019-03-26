library(hexbin)


### Name: smooth.hexbin
### Title: Hexagon Bin Smoothing
### Aliases: smooth.hexbin smoothbin-class
### Keywords: misc

### ** Examples

x <- rnorm(10000)
y <- rnorm(10000)
bin <- hexbin(x,y)
# show the smooth counts in gray level
smbin  <- smooth.hexbin(bin)
plot(smbin, main = "smooth.hexbin(.)")

# Compare the smooth and the origin
smbin1 <- smbin
smbin1@count <- as.integer(ceiling(smbin@count/sum(smbin@wts)))
plot(smbin1)
smbin2 <- smooth.hexbin(bin,wts=c(1,0,0))  # expand the domain for comparability
plot(smbin2)



