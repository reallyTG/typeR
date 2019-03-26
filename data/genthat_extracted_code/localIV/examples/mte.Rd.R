library(localIV)


### Name: mte
### Title: Estimation of Marginal Treatment Effects (MTE)
### Aliases: mte

### ** Examples

mte_fit <- mte(selection = d ~ x + z, outcome = y ~ x,
  method = "localIV", data = toydata)
summary(mte_fit$ps_model)

op <- par(mfrow = c(1, 3))

# heterogeneous treatment effects by the propensity score
with(mte_fit, curve(mte_tilde(p = x, u = 0.5), 0, 1))

# heterogeneous treatment effects by the latent resistance
with(mte_fit, curve(mte_tilde(p = 0.5, u = x), 0, 1))

# heterogeneous treatment effects among marginal entrants
with(mte_fit, curve(mte_tilde(p = x, u = x), 0, 1))

par(op)




