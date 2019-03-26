library(Davies)


### Name: davies.start
### Title: start value for Davies minimization routines
### Aliases: davies.start
### Keywords: distribution

### ** Examples

d <- rchisq(40,1)
davies.start(d)
least.squares(d)

params <- c(10 , 0.1 , -0.1)
x <- rdavies(100 , params)
davies.start(x)

f <- function(threeps){objective(davies.start(x,threeps),x)}

(jj<-optim(c(0.1,0.5,0.9),f))
davies.start(x,jj$par)
least.squares(x)

#not bad at all.




