library(Smisc)


### Name: timeIt
### Title: Times the execution of an expression
### Aliases: timeIt
### Keywords: misc

### ** Examples

# We can assign the object within the call to timeIt():
timeIt(x1 <- rnorm(10^6))
str(x1)

## No test: 
# We can just run the expression without assigning it to anything
timeIt(rnorm(10^7), units = "m")

# Or we can assign the result externally
x2 <- timeIt(rnorm(10^7))
str(x2)

# To store the elapsed time:
x3 <- timeIt(rnorm(10^7), verbose = FALSE, return.time = TRUE)
x3[c("elapsed","units")]
## End(No test)



