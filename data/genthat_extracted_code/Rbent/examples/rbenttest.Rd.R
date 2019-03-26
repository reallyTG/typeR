library(Rbent)


### Name: rbenttest
### Title: test the existence of change point in the bent line regression
### Aliases: rbenttest
### Keywords: rbenttest

### ** Examples

# for the example of  MRS data
data(data_mrs)
x <- log(data_mrs$mass)
y <- log(data_mrs$speed)
z <- data_mrs$hopper
p.value <- rbenttest(y, cbind(1, z), x, NB = 50)$p.value

# for the example of bedload transport data
data(data_transport)
x <- data_transport$x
y <- data_transport$y
p.value <- rbenttest(y, 1, x, NB = 50)$p.value



