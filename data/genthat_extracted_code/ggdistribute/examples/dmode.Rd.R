library(ggdistribute)


### Name: dmode
### Title: Mode from density estimation
### Aliases: dmode

### ** Examples

x <- rchisq(1000, 3)
hist(x, br=50)
abline(v = dmode(x), col = "red")
abline(v = median(x), col = "green")
abline(v = mean(x), col = "blue")



