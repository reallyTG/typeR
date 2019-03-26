library(TropFishR)


### Name: VBGF
### Title: Von Bertalanffy Growth function (VBGF)
### Aliases: VBGF
### Keywords: VBGF function growth

### ** Examples

# calculation of lengths
# with t0
t <- seq(0,6,0.1)
Lt <- VBGF(list(Linf=80, K=0.6, t0=-0.1),t=t)
plot(t, Lt, t="l")

# with L0
t <- seq(0,6,0.1)
Lt <- VBGF(list(Linf=80, K=0.6, L0=2),t=t)
plot(t, Lt, t="l")

# with Winf
t <- seq(0,6,0.1)
Wt <- VBGF(list(Winf=4000, K=0.8), t=t)
plot(t, Wt, t="l")

# seasonalised VBGF
t <- seq(0,6,0.1)
Lt <- VBGF(list(Linf=80, K=0.6, t0=-0.1, ts=0.5, C=0.75),t=t)
plot(t, Lt, t="l")


# calculation of ages
L <- seq(2,200,0.1)
t <- VBGF(L = L, list(Linf=210, K=0.8, C= 0.75))
plot(t, L, t="l")




