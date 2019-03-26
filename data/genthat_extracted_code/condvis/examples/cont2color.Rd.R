library(condvis)


### Name: cont2color
### Title: Assign colours to numeric vector
### Aliases: cont2color

### ** Examples

x <- runif(200)
plot(x, col = cont2color(x, c(0,1)))

plot(x, col = cont2color(x, c(0,0.5)))

plot(sort(x), col = cont2color(sort(x), c(0.25,0.75)), pch = 16)
abline(h = c(0.25, 0.75), lty = 3)




