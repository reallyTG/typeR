library(cape)


### Name: segment.region
### Title: Divide a region into equal parts.
### Aliases: segment.region
### Keywords: internal

### ** Examples

num.points <- 5
coords.1 <- segment.region(region.min = 5, region.max = 7, 
num.points = num.points, alignment = c("ends"))
coords.2 <- segment.region(region.min = 5, region.max = 7, 
num.points = num.points, alignment = c("center"))
plot(x = coords.1, y = rep(0.25, num.points), xlim = c(4,8), 
ylim = c(0,1),col = "blue", pch = 16, xlab = "", ylab = "", 
axes = FALSE)
points(x = coords.2, y = rep(0.75, num.points), xlim = c(4,8), 
ylim = c(0,1),col = "purple", pch = 16)
abline(v = 5); abline(v = 7); axis(1)




