library(qrmix)


### Name: Huber
### Title: Huber Loss
### Aliases: Huber

### ** Examples


set.seed(1)
x = rnorm(200, mean = 1)
y = Huber(x)
plot(x, y)
abline(h = (1.345)^2/2)




