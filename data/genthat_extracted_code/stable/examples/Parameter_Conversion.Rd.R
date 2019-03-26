library(stable)


### Name: Parameter_Conversion
### Title: Easy conversion of parameters between stabledist and stable
### Aliases: Parameter_Conversion s2sd sd2s

### ** Examples

q <- -1
# nolan pm=1 parameters:
a <-  1.3
b <-  -0.4
c <-  2
d <-  0.75
s <- sd2s(alpha=a, beta=b, gamma=c, delta=d)
stable::pstable(q, tail = s$tail, skew=s$skew, disp = s$disp, loc  = s$loc)
stabledist::pstable(q, alpha=a, beta=b , gamma=c , delta=d, pm=1)
sd <- s2sd(tail = s$tail, skew=s$skew, disp = s$disp, loc  = s$loc)
stabledist::pstable(q, alpha=sd$alpha, beta=sd$beta , gamma=sd$gamma , delta=sd$delta, pm=1)



