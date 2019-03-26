library(errors)


### Name: groupGeneric.errors
### Title: S3 Group Generic Functions
### Aliases: groupGeneric.errors Math.errors Ops.errors Summary.errors

### ** Examples

x <- set_errors(1:3, 0.1)
exp(x)
log(x)
cumsum(x)
cumprod(x)

y <- set_errors(4:6, 0.2)
x / sqrt(y) + y * sin(x)

# numeric values are automatically coerced to errors
x^2

# boolean operators drop uncertainty
y > x

c(min(x), max(x))
range(x)
sum(y)
prod(y)




