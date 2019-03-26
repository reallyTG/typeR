library(analytics)


### Name: tgsboot
### Title: Bootstrap for Stationary Data
### Aliases: tgsboot

### ** Examples

set.seed(123)
x = rnorm(1e4)
boot = tgsboot(x)
boot = tgsboot(x, b.info = TRUE)
boot = tgsboot(x, nb = 2)
boot = tgsboot(x, nb = 2, b.info = TRUE)




