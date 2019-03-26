library(sfsmisc)


### Name: u.log
### Title: (Anti)Symmetric Log High-Transform
### Aliases: u.log
### Keywords: arith

### ** Examples

curve(u.log, -3, 10); abline(h=0, v=0, col = "gray20", lty = 3)
curve(1 + log(x), .01,  add = TRUE, col= "brown") # simple log
curve(u.log(x,    2),   add = TRUE, col=2)
curve(u.log(x, c= 0.4), add = TRUE, col=4)



