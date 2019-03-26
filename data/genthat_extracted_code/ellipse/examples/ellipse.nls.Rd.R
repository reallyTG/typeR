library(ellipse)


### Name: ellipse.nls
### Title: Outline an approximate pairwise confidence region
### Aliases: ellipse.nls
### Keywords: dplot nonlinear

### ** Examples

# Plot an approximate 95% confidence region for the weight and displacement
# parameters in the Michaelis Menten model
data(Puromycin)
fit <- nls(rate ~ Vm*conc/(K + conc), data = Puromycin, subset = state=="treated", 
    start = list(K = 0.05, Vm = 200))
plot(ellipse(fit,which=c('Vm','K')), type = 'l')
params <- fit$m$getPars()
points(params['Vm'],params['K'])



