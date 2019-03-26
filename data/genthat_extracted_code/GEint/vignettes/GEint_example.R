## ----fig.width=8, fig.height=5, echo=FALSE-------------------------------
set.seed(100)
n <- 10000
n_perturb <- n
Z_sample <- abs(rnorm(n=n))
Z_sample <- sort(Z_sample, decreasing=TRUE)
Z_sample[1:n_perturb] <- Z_sample[1:n_perturb] + rep(0.15, n_perturb)
p_values <- 1-pchisq(Z_sample^2, df=1)
observed <- sort(-log10(p_values), decreasing=TRUE)
expected <- -log10((1:n)/(n+1))
plot(expected, observed)
abline(0,1)

## ----fig.width=8, fig.height=5-------------------------------------------
library(GEint)
beta_list <- list(1, 1, 1, 0, c(1,1), 1)
rho_list <- list(0.1, c(0.1, 0.1), c(0.1,0.1), 0.1, 0.1, c(0.1, 0.1))
prob_G <- 0.3
cov_Z <- matrix(data=c(1, 0.2, 0.2, 1), nrow=2, ncol=2)
cov_W <- 1
normal_assumptions <- GE_bias_normal_squaredmis(beta_list=beta_list, rho_list=rho_list, prob_G=prob_G, cov_Z=cov_Z, cov_W=cov_W)

## ----fig.width=8, fig.height=5-------------------------------------------
cov_list <- normal_assumptions$cov_list
cov_mat_list <- normal_assumptions$cov_mat_list
mu_list <- normal_assumptions$mu_list
HOM_list <- normal_assumptions$HOM_list
no_assumptions <- GE_bias(beta_list, cov_list, cov_mat_list, mu_list, HOM_list)

# The results should match:
unlist(no_assumptions)
unlist(normal_assumptions$alpha_list)

## ----fig.width=8, fig.height=5-------------------------------------------
set.seed(100)
n <- 500
Y_continuous <- rnorm(n=n)
Y_binary <- rbinom(n=n, size=1, prob=0.5)
E <- rnorm(n=n)
G <- rbinom(n=n, size=2, prob=0.3)
design_mat <- cbind(1, G, E, G*E)

GE_BICS(outcome=Y_continuous, design_mat=design_mat, desired_coef=4, outcome_type='C')
GE_BICS(outcome=Y_binary, design_mat=design_mat, desired_coef=4, outcome_type='D')

