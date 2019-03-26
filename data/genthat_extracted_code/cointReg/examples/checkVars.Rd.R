library(cointReg)


### Name: checkVars
### Title: Multiple variable checks for certain values.
### Aliases: checkVars

### ** Examples

env = environment()
x.data = data.frame(a = 1:10, b = 20:11)
y.data = 1:10
checkVars(x.coint = x.data, y = y.data, .env = env)
x.coint
y

test = checkVars(x.coint = x.data, y = y.data, out = "return")
str(test)

# If the variables already have the "right" name,
# there's no need to do something like
# checkVars(kernel = kernel, bandwidth = bandwidth) -
# just call checkVars without specifing the arguments:
kernel = "q"
bandwidth = "a"
(checkVars(kernel, bandwidth, out = "return"))




