library(RandomFields)


### Name: GSPSJ06
### Title: Fast and Exact Simulation of Large Gaussian Lattice Systems in
###   R2
### Aliases: GSPSJ06
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

## Figure 1 (pretty time consuming)
stabletest <- function(alpha, theta, size=512) {
  RFoptions(trials=1, tolIm = 1e-8, tolRe=0, force = FALSE,
            useprimes=TRUE, strategy=0, skipchecks=!FALSE,
             storing=TRUE)
  model <- RMcutoff(diameter=theta, a=1, RMstable(alpha=alpha))
  RFcov(dist=0, model=model, dim=2, seed=0)
  r <- RFgetModelInfo(modelname="RMcutoff", level=3)$storage$R_theor
  x <- seq(0, r, by= r / (size - 1)) * theta
  err <- try(RFsimulate(x, x, model=RPcirculant(model), n=0))
  return(if (class(err) == "try-error") NA else r)
}

alphas <- seq(1.52, 2.0, 0.02) 
thetas <- seq(0.05, 3.5, 0.05)
## Don't show: 
if (RFoptions()$internal$examples_reduced) {
   warning("reduced size of alphas and thetas")
   alphas <- seq(1.52, 2.0, 0.5) 
   thetas <- seq(0.1, 3.5, 2)
}
## End(Don't show)
m <- matrix(NA, nrow=length(thetas), ncol=length(alphas))
for (it in 1:length(thetas)) {
  theta <- thetas[it]
  for (ia in 1:length(alphas)) {
  alpha <- alphas[ia]
  cat("alpha=", alpha, "theta=", theta,"\n")
  m[it, ia] <- stabletest(alpha=alpha, theta=theta)
  if (is.na(m[it, ia])) break
  }
  if (any(is.finite(m))) image(thetas, alphas, m, col=rainbow(100))
}

## Don't show: 
FinalizeExample()
## End(Don't show)


