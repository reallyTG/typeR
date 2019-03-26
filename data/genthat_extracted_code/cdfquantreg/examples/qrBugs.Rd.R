library(cdfquantreg)


### Name: qrBugs
### Title: Running cdf quantile regression in OpenBUGS
### Aliases: qrBugs

### ** Examples

data(cdfqrExampleData)
## Not run: 
##D # Need to OpenBUGS has been installed, and R2OpenBUGS has been loaded first. 
##D library(R2OpenBUGS)
##D bugfit <- qrBugs(crc99 ~ vert | confl, data = JurorData, 't2', 't2',clearWD=TRUE)
##D bugfit
##D Inference for Bugs model at "bugmodel.txt", 
##D # Current: 2 chains, each with 10000 iterations (first 5000 discarded)
##D # Cumulative: n.sims = 10000 iterations saved
##D # mean  sd  2.5%   25%   50%   75% 97.5% Rhat n.eff
##D # b_0        0.8 0.1   0.6   0.7   0.8   0.9   1.0    1   830
##D # d_0       -0.2 0.1  -0.4  -0.3  -0.2  -0.1   0.1    1  1700
##D # b_vert     0.1 0.1  -0.1   0.0   0.1   0.2   0.3    1   170
##D # d_confl    0.0 0.1  -0.3  -0.1   0.0   0.0   0.2    1  4000
##D # deviance -49.3 2.8 -52.8 -51.3 -49.9 -47.9 -42.1    1  7400
##D # 
##D # For each parameter, n.eff is a crude measure of effective sample size,
##D # and Rhat is the potential scale reduction factor (at convergence, Rhat=1).
##D # 
##D # DIC info (using the rule, pD = Dbar-Dhat)
##D # pD = 4.0 and DIC = -45.3
##D # DIC is an estimate of expected predictive error (lower deviance is better).
## End(Not run)



