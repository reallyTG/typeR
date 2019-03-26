library(RBesT)


### Name: gMAP
### Title: Meta-Analytic-Predictive Analysis for Generalized Linear Models
### Aliases: gMAP print.gMAP fitted.gMAP coef.gMAP as.matrix.gMAP
###   summary.gMAP

### ** Examples

# Binary data example 1

# Mean response rate is ~0.25. For binary endpoints
# a conservative choice for tau is a HalfNormal(0,1) as long as
# the mean response rate is in the range of 0.2 to 0.8. For
# very small or large rates consider the n_infinity approach
# illustrated below.
# for exact reproducible results, the seed must be set
set.seed(34563)
map_AS <- gMAP(cbind(r, n-r) ~ 1 | study,
               family=binomial,
               data=AS,
               tau.dist="HalfNormal", tau.prior=1,
               beta.prior=2,
               ## ensure fast example runtime (use defaults)
               ## please ignore the warning of less than 1000 draws
               warmup=500, iter=1000, chains=2, thin=1)
print(map_AS)

# obtain numerical summaries
map_sum <- summary(map_AS)
print(map_sum)
names(map_sum)
# [1] "tau"        "beta"       "theta.pred" "theta"
map_sum$theta.pred

## Not run: 
##D # graphical model checks (returns list of ggplot2 plots)
##D map_checks <- plot(map_AS)
##D # forest plot with shrinkage estimates
##D map_checks$forest_model
##D # density of MAP prior on response scale
##D map_checks$densityThetaStar
##D # density of MAP prior on link scale
##D map_checks$densityThetaStarLink
## End(Not run)

# obtain shrinkage estimates
fitted(map_AS)

# regression coefficients
coef(map_AS)

# finally fit MAP prior with parametric mixture
map_mix <- mixfit(map_AS, Nc=2)
plot(map_mix)$mix

## Not run: 
##D # optionally select number of components automatically via AIC
##D map_automix <- automixfit(map_AS)
##D plot(map_automix)$mix
## End(Not run)

# Normal example 2, see normal vignette

# Prior considerations

# The general principle to derive a prior for tau can be based on the
# n_infinity concept as discussed in Neuenschwander et al., 2010.
# This assumes a normal approximation which applies for the colitis
# data set as:
p_bar <- mean(with(colitis, r/n))
s <- round(1/sqrt(p_bar * (1-p_bar)), 1)
# s is the approximate sampling standard deviation and a
# conservative prior is tau ~ HalfNormal(0,s/2)
tau_prior_sd <- s/2

# Evaluate HalfNormal prior for tau
tau_cat <- c(pooling=0
            ,small=0.0625
            ,moderate=0.125
            ,substantial=0.25
            ,large=0.5
            ,veryLarge=1
            ,stratified=Inf)
# Interval probabilites (basically saying we are assuming
# heterogeniety to be smaller than very large)
diff(2*pnorm(tau_cat * s, 0, tau_prior_sd))
# Cumulative probabilities as 1-F
1 - 2*(pnorm(tau_cat * s, 0, tau_prior_sd) - 0.5)




