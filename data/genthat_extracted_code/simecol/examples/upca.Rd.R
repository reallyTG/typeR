library(simecol)


### Name: upca
### Title: The Uniform Period Chaotic Amplitude Model
### Aliases: upca
### Keywords: datasets

### ** Examples

##============================================
## Basic Usage:
##   explore the example
##============================================
data(upca)
plot(sim(upca))

# omit stabilizing parameter wstar
parms(upca)["wstar"] <- 0
plot(sim(upca))

# change functional response from
# Holling II (default) to Lotka-Volterra
equations(upca)$f <- function(x, y, k) x * y
plot(sim(upca))

##============================================
## Implementation:
##   The code of the UPCA model
##============================================
upca <- new("odeModel",
  main = function(time, init, parms) {
    u      <- init[1]
    v      <- init[2]
    w      <- init[3]
    with(as.list(parms), {
      du <-  a * u           - alpha1 * f(u, v, k1)
      dv <- -b * v           + alpha1 * f(u, v, k1) +
                             - alpha2 * f(v, w, k2)
      dw <- -c * (w - wstar) + alpha2 * f(v, w, k2)
      list(c(du, dv, dw))
    })
  },
  equations  = list(
    f1 = function(x, y, k){x*y},           # Lotka-Volterra
    f2 = function(x, y, k){x*y / (1+k*x)}  # Holling II
  ),
  times  = c(from=0, to=100, by=0.1),
  parms  = c(a=1, b=1, c=10, alpha1=0.2, alpha2=1,
    k1=0.05, k2=0, wstar=0.006),
  init = c(u=10, v=5, w=0.1),
  solver = "lsoda"
)

equations(upca)$f <- equations(upca)$f2




