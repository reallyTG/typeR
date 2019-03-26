library(tseriesChaos)


### Name: Lyapunov exponent
### Title: Tools to evaluate the maximal Lyapunov exponent of a dynamic
###   system
### Aliases: lyap lyap_k
### Keywords: ts

### ** Examples

output <-lyap_k(lorenz.ts, m=3, d=2, s=200, t=40, ref=1700, k=2, eps=4)
plot(output)
lyap(output, 0.73, 2.47)



