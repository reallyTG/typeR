library(elliptic)


### Name: half.periods
### Title: Calculates half periods in terms of e
### Aliases: half.periods
### Keywords: math

### ** Examples


half.periods(g=c(8,4))                ## Example 6, p665, LHS

u <- half.periods(g=c(-10,2))
massage(c(u[1]-u[2] , u[1]+u[2]))     ## Example 6, p665, RHS

half.periods(g=c(10,2))               ## Example 7, p665, LHS

u <- half.periods(g=c(7,6))
massage(c(u[1],2*u[2]+u[1]))          ## Example 7, p665, RHS


half.periods(g=c(1,1i, 1.1+1.4i))
half.periods(e=c(1,1i, 2, 1.1+1.4i))


g.fun(half.periods(g=c(8,4)))         ##  should be c(8,4)





