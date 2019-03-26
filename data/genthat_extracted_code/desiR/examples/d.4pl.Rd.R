library(desiR)


### Name: d.4pl
### Title: Four parameter logistic desirability function
### Aliases: d.4pl

### ** Examples

# High values are desirable
x1 <- seq(80, 120, 0.01)
d1 <- d.4pl(x = x1, hill = 20, inflec = 100)
plot(d1 ~ x1, type="l")

# Low values are desirable (negative slope), with a minimum
# desirability of 0.3
d2 <- d.4pl(x = x1, hill = -30, inflec = 100, des.min=0.3)
plot(d2 ~ x1, type="l", ylim=c(0,1))

# Beware of how the function behaves when the data contain both
# positive and negative values
x2 <- seq(-20, 20, 0.01)
d3 <- d.4pl(x = x2, hill = 20, inflec = 1)
plot(d3 ~ x2, type="l")



