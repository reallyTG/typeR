library(ellipse)


### Name: ellipse.profile.nls
### Title: Pairwise profile sketch
### Aliases: ellipse.profile.nls
### Keywords: dplot models

### ** Examples

# Plot an approximate 95% confidence region for the Puromycin
# parameters Vm and K, and overlay the ellipsoidal region
data(Puromycin)
Purboth <- nls(formula = rate ~ ((Vm + delV * (state == "treated"))
  * conc)/(K + conc), data = Puromycin,
  start = list(Vm = 160, delV = 40, K = 0.05))
Pur.prof <- profile(Purboth)
plot(ellipse(Pur.prof, which = c('Vm', 'K')), type = 'l')
lines(ellipse(Purboth, which = c('Vm', 'K')), lty = 2)
params <- Purboth$m$getPars()
points(params['Vm'],params['K'])



