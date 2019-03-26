library(spatialprobit)


### Name: sarorderedprobit
### Title: Bayesian estimation of the SAR ordered probit model
### Aliases: sarorderedprobit sar_ordered_probit_mcmc

### ** Examples

## Not run: 
##D library(spatialprobit)
##D set.seed(1)
##D 
##D ################################################################################
##D #
##D # Example with J = 4 alternatives
##D #
##D ################################################################################
##D 
##D # set up a model like in SAR probit
##D J <- 4   
##D # ordered alternatives j=1, 2, 3, 4 
##D # --> (J-2)=2 cutoff-points to be estimated phi_2, phi_3
##D phi <- c(-Inf, 0,  +1, +2, Inf)    # phi_0,...,phi_j, vector of length (J+1)
##D # phi_1 = 0 is a identification restriction
##D 
##D # generate random samples from true model
##D n <- 400             # number of items
##D k <- 3               # 3 beta parameters
##D beta <- c(0, -1, 1)  # true model parameters k=3 beta=(beta1,beta2,beta3)
##D rho <- 0.75
##D # design matrix with two standard normal variates as "coordinates"
##D X <- cbind(intercept=1, x=rnorm(n), y=rnorm(n))
##D 
##D # identity matrix I_n
##D I_n <- sparseMatrix(i=1:n, j=1:n, x=1)
##D 
##D # build spatial weight matrix W from coordinates in X
##D W <- kNearestNeighbors(x=rnorm(n), y=rnorm(n), k=6)
##D 
##D # create samples from epsilon using independence of distributions (rnorm()) 
##D # to avoid dense matrix I_n
##D eps <- rnorm(n=n, mean=0, sd=1)
##D z   <- solve(qr(I_n - rho * W), X ##D 
##D 
##D # ordered variable y:
##D # y_i = 1 for phi_0 < z <= phi_1; -Inf < z <= 0
##D # y_i = 2 for phi_1 < z <= phi_2
##D # y_i = 3 for phi_2 < z <= phi_3
##D # y_i = 4 for phi_3 < z <= phi_4
##D 
##D # y in {1, 2, 3} 
##D y   <- cut(as.double(z), breaks=phi, labels=FALSE, ordered_result = TRUE)
##D table(y)
##D 
##D #y
##D #  1   2   3   4 
##D #246  55  44  55
##D 
##D # estimate SAR Ordered Probit
##D res <- sar_ordered_probit_mcmc(y=y, X=X, W=W, showProgress=TRUE)
##D summary(res)
##D 
##D #----MCMC spatial autoregressive ordered probit----
##D #Execution time  = 12.152 secs
##D #
##D #N draws         =   1000, N omit (burn-in)=    100
##D #N observations  =    400, K covariates    =      3
##D #Min rho         = -1.000, Max rho         =  1.000
##D #--------------------------------------------------
##D #
##D #y
##D #  1   2   3   4 
##D #246  55  44  55 
##D #          Estimate Std. Dev  p-level t-value Pr(>|z|)    
##D #intercept -0.10459  0.05813  0.03300  -1.799   0.0727 .  
##D #x         -0.78238  0.07609  0.00000 -10.283   <2e-16 ***
##D #y          0.83102  0.07256  0.00000  11.452   <2e-16 ***
##D #rho        0.72289  0.04045  0.00000  17.872   <2e-16 ***
##D #y>=2       0.00000  0.00000  1.00000      NA       NA    
##D #y>=3       0.74415  0.07927  0.00000   9.387   <2e-16 ***
##D #y>=4       1.53705  0.10104  0.00000  15.212   <2e-16 ***
##D #---
##D 
##D addmargins(table(y=res$y, fitted=res$fitted.response))
##D 
##D #     fitted
##D #y       1   2   3   4 Sum
##D #  1   218  26   2   0 246
##D #  2    31  19   5   0  55
##D #  3    11  19  12   2  44
##D #  4     3  14  15  23  55
##D #  Sum 263  78  34  25 400
## End(Not run)



