library(VGAM)


### Name: Yules
### Title: Yule-Simon Distribution
### Aliases: Yules dyules pyules qyules ryules
### Keywords: distribution

### ** Examples

dyules(1:20, 2.1)
ryules(20, 2.1)

round(1000 * dyules(1:8, 2))
table(ryules(1000, 2))

## Not run: 
##D  x <- 0:6
##D plot(x, dyules(x, shape = 2.2), type = "h", las = 1, col = "blue") 
## End(Not run)



