library(credsubs)


### Name: credsubs
### Title: Constructs a credible subset pair
### Aliases: credsubs

### ** Examples

### Sample from regression surface posterior
reg.surf.sample <- matrix(rnorm(1000, mean=1:10), ncol=2, byrow=TRUE)
credsubs(reg.surf.sample, cred.level=0.80)

### Parametric case
design <- cbind(1, 1:10)
params <- matrix(rnorm(200, mean=1:2), ncol=2, byrow=TRUE)
credsubs(params, design)

### With custom function
params.sd <- cbind(1 / rgamma(100, 1), params)
FUN.sd <- function(x, params) { params[, -1] %*% t(x) / params[, 1] }
credsubs(params.sd, design, FUN.sd, threshold=1)




