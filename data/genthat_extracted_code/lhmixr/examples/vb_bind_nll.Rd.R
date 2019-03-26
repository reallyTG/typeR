library(lhmixr)


### Name: vb_bind_nll
### Title: Negative log-likelihood for potentially constrained von
###   Bertalanffy growth model (typically used internally).
### Aliases: vb_bind_nll

### ** Examples

## Unconstrained model 
binding <- matrix(c(1:8), ncol = 2, byrow = TRUE)
rownames(binding) <- c("lnlinf", "lnk", "lnnt0", "lnsigma")
colnames(binding) <- c("female", "male")
## starting values 
start.par <- c(rep(log(25), 2), rep(log(0.2), 2), rep(log(3), 2), rep(log(1), 2))
vb_bind_nll(theta = start.par, binding = binding,
            data = data.frame(age = rep(1, 2), length = rep(10, 2), weights = c(1, 0)),
            distribution = "normal")



