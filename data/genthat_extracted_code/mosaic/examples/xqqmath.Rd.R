library(mosaic)


### Name: xqqmath
### Title: Augmented version of 'qqmath'
### Aliases: xqqmath panel.xqqmath

### ** Examples

x <- rnorm(100)
xqqmath( ~ x)                  # with quartile line
xqqmath( ~ x, fitline = TRUE)  # with fitted line
xqqmath( ~ x, idline = TRUE)   # with y = x
x <- rexp(100, rate = 10)
xqqmath( ~ x, distribution = qexp)     # with quartile line
xqqmath( ~ x, distribution = qexp, slope = 1/10) 
xqqmath( ~ x, distribution = qexp, slope = mean(x)) 



