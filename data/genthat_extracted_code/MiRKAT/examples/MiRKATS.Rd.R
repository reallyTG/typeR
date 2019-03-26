library(MiRKAT)


### Name: MiRKATS
### Title: Microbiome Regression-based Kernel Association Test for Survival
### Aliases: MiRKATS

### ** Examples


###################################
# Generate data
require(GUniFrac)
set.seed(1)

# Throat microbiome data
data(throat.tree)
data(throat.otu.tab)
unifracs = GUniFrac(throat.otu.tab, throat.tree, alpha = c(1))$unifracs
D1 = unifracs[,,"d_1"]  # 60 subjects

# Covariates and outcomes
X <- matrix(rnorm(120), nrow=60)
S <- rexp(60, 3)
C <- rexp(60, 1)
D <- (S<=C)        # event indicator
U <- pmin(S, C)    # observed follow-up time

MiRKATS(kd = D1, distance = TRUE, obstime = U, delta = D, covar = X, beta = NULL)




