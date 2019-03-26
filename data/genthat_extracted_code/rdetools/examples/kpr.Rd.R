library(rdetools)


### Name: kpr
### Title: Kernel projection regression
### Aliases: kpr
### Keywords: models classif regression

### ** Examples

## kernel projection regression after
## calling selectmodel (recommended)
d <- sincdata(100, 0.1) # generate sinc data
# do model selection
m <- selectmodel(d$X, d$y, sigma = logspace(-3, 3, 100))
f <- kpr(m)
plot(f, -4, 4)



