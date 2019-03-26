library(hbm)


### Name: generate.random.conf
### Title: Generate a Random Chain Configuration
### Aliases: generate.random.conf

### ** Examples

set.seed(2)
n = 100 
conf = generate.random.conf(n, k = 2)
plot(conf, xlab = "x", ylab = "y")

conf = generate.random.conf(n, k = 2, scale = FALSE)
plot(conf, xlab = "x", ylab = "y")




