library(dhh)


### Name: qhh
### Title: Quantiels of Of The Heavy-Headed Distribution
### Aliases: qhh
### Keywords: ~kwd1 ~kwd2

### ** Examples

qhh(0.9)

qhh(0.9, a=0, b=1, alpha=0.1)

qhh(0.9, a=0, b=10, alpha=0.1)

qhh((1:9)/10)

curve(qhh, from = 0.1, to = 0.9)

curve(qhh(x, 0, 1, 0.1), from = 0.1, to = 0.9)
curve(qhh(x, a=10, b=100, alpha = 0.1), from = 0.1, to = 0.9)



