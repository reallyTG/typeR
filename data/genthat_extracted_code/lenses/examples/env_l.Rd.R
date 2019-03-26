library(lenses)


### Name: env_l
### Title: Environment lens
### Aliases: env_l
### Keywords: datasets

### ** Examples

x <- 10
f <- (function(){x <- 2; function() x + 1})()
f

f()
view(f, env_l)$x

g <- over(f, env_l, parent.env)
g()



