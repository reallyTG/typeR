library(CircularDDM)


### Name: logLik_dt
### Title: Log-Likelihood for Circular First Passage Time
### Aliases: logLik_dt

### ** Examples

x <- cbind(
RT=c(1.2595272, 0.8693937, 0.8009044, 1.0018933, 2.3640007, 1.0521304),
R =c(1.9217430, 1.7844653, 0.2662521, 2.1569724, 1.7277440, 0.8607271)
)
pVec <- c(a=2.45, vx=1.5, vy=1.25, t0=.1, s=1)
den  <- logLik_dt(x, pVec=pVec);
den



