library(pracma)


### Name: laguerre
### Title: Laguerre's Method
### Aliases: laguerre
### Keywords: math

### ** Examples

# 1 x^5 - 5.4 x^4 + 14.45 x^3 - 32.292 x^2 + 47.25 x - 26.46
p <- c(1.0, -5.4, 14.45, -32.292, 47.25, -26.46)
laguerre(p, 1)   #=> 1.2
laguerre(p, 2)   #=> 2.099987     (should be 2.1)
laguerre(p, 2i)  #=> 0+2.236068i  (+- 2.2361i, i.e sqrt(-5))



