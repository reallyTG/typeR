library(smacpod)


### Name: circles.plot
### Title: Plot circles
### Aliases: circles.plot

### ** Examples

co = cbind(c(1, 2, 5, 6, 9), c(1, 2, 5, 6, 9))
r = c(1.25, 1.25, 1.25, 1.25, 1.25)
# draw circles
circles.plot(co, r)
circles.plot(co, r, 
   ccol = c("blue", "blue", "orange", "orange", "brown"),
   density = c(10, 20, 30, 40, 50),
   angle = c(45, 135, 45, 136, 90))



