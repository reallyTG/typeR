library(cquad)


### Name: sim_panel_logit
### Title: Simulate data from the dynamic logit model
### Aliases: sim_panel_logit
### Keywords: panel data

### ** Examples

# simulate data from the static logit model
n = 1000; TT = 5                 # sample size, number of time occasions
id = (1:n)%x%rep(1,TT)           # vector of indices
al = rnorm(n)                    # simulate alpha
X = matrix(rnorm(2*n*TT),n*TT,2) # simulate two covariates
eta1 = c(1,-1)                 # vector of parameters
out = sim_panel_logit(id,al,X,eta1)
y1 = out$yv

# simulate data from the dynamic logit model
eta2 = c(1,-1,2)            # vector of parameters including state dependence
out = sim_panel_logit(id,al,X,eta2,dyn=TRUE)
y2 = out$yv



