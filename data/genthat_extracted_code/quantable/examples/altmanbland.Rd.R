library(quantable)


### Name: altmanbland
### Title: altman-bland plot
### Aliases: altmanbland

### ** Examples

x <- seq(1:300)/10
x <- x + rnorm(length(x),0,0.5)
y <- seq(1:300)/10
y <- y + rnorm(length(y),0,0.5)
altmanbland(y,x)




