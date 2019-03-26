library(elliptic)


### Name: g.fun
### Title: Calculates the invariants g2 and g3
### Aliases: g.fun g2.fun g3.fun g2.fun.lambert g3.fun.lambert
###   g2.fun.direct g3.fun.direct g2.fun.fixed g3.fun.fixed g2.fun.divisor
###   g3.fun.divisor g2.fun.vectorized g3.fun.vectorized e18.1.1
### Keywords: math

### ** Examples


g.fun(half.periods(g=c(8,4+1i)))  ## should be c(8,4+1i)


## Example 4, p664, LHS:
omega <- c(10,11i)
(g2 <- g2.fun(omega))
(g3 <- g3.fun(omega))
e1e2e3(Re(c(g2,g3)))

## Example 4, p664, RHS:
omega2 <- 10
omega2dash <- 11i
omega1 <- (omega2-omega2dash)/2   ## From figure 18.1, p630
(g2 <- g2.fun(c(omega1,omega2)))
(g3 <- g3.fun(c(omega1,omega2)))
e1e2e3(Re(c(g2,g3)))



