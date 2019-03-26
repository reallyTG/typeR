library(credsubs)


### Name: sim.cred.band
### Title: Constructs a simultaneous credible band
### Aliases: sim.cred.band

### ** Examples

### Sample from regression surface posterior
reg.surf.sample <- matrix(rnorm(1000, mean=1:10), ncol=2, byrow=TRUE)
sim.cred.band(reg.surf.sample, cred.level=0.80)

### Parametric case
design <- cbind(1, 1:10)
params <- matrix(rnorm(200, mean=1:2), ncol=2, byrow=TRUE)
sim.cred.band(params, design)

### With custom function
params.sd <- cbind(1 / rgamma(100, 1), params)
FUN.sd <- function(x, params) { params[, -1] %*% t(x) / params[, 1] }
sim.cred.band(params.sd, design, FUN.sd)




