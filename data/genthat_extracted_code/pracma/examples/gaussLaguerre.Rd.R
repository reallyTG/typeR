library(pracma)


### Name: gaussLaguerre
### Title: Gauss-Laguerre Quadrature Formula
### Aliases: gaussLaguerre
### Keywords: math

### ** Examples

cc <- gaussLaguerre(7)
# integrate exp(-x) from 0 to Inf
sum(cc$w)                     # 1
# integrate x^2 * exp(-x)     # integral x^n * exp(-x) is n!
sum(cc$w * cc$x^2)            # 2
# integrate sin(x) * exp(-x)
cc <- gaussLaguerre(17, 0)    # we need more nodes
sum(cc$w * sin(cc$x))         #=> 0.499999999994907 , should be 0.5



