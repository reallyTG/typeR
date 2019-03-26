library(plac)


### Name: cum.haz
### Title: Calulate the Values of the cumulative Hazard at Fixed Times
### Aliases: cum.haz

### ** Examples

dat1 = sim.ltrc(n = 100)$dat
est = PLAC(ltrc.formula = Surv(As, Ys, Ds) ~ Z1 + Z2,
     ltrc.data = dat1, td.type = "none")
H = cum.haz(est, t.eval = seq(0.1, 0.9, 0.1))
H$L
H$se.L



