library(bridgesampling)


### Name: turtles
### Title: Turtles Data from Janzen, Tucker, and Paukstis (2000)
### Aliases: turtles
### Keywords: dataset

### ** Examples


## Not run: 
##D 
##D ################################################################################
##D # BAYESIAN GENERALIZED LINEAR MIXED MODEL (PROBIT REGRESSION)
##D ################################################################################
##D 
##D library(bridgesampling)
##D library(rstan)
##D 
##D data("turtles")
##D 
##D #-------------------------------------------------------------------------------
##D # plot data
##D #-------------------------------------------------------------------------------
##D 
##D # reproduce Figure 1 from Sinharay & Stern (2005)
##D xticks <- pretty(turtles$clutch)
##D yticks <- pretty(turtles$x)
##D 
##D plot(1, type = "n", axes = FALSE, ylab = "", xlab = "", xlim = range(xticks),
##D      ylim =  range(yticks))
##D points(turtles$clutch, turtles$x, pch = ifelse(turtles$y, 21, 4), cex = 1.3,
##D        col = ifelse(turtles$y, "black", "darkred"), bg = "grey", lwd = 1.3)
##D axis(1, cex.axis = 1.4)
##D mtext("Clutch Identifier", side = 1, line = 2.9, cex = 1.8)
##D axis(2, las = 1, cex.axis = 1.4)
##D mtext("Birth Weight (Grams)", side = 2, line = 2.6, cex = 1.8)
##D 
##D #-------------------------------------------------------------------------------
##D # Analysis: Natural Selection Study (compute same BF as Sinharay & Stern, 2005)
##D #-------------------------------------------------------------------------------
##D 
##D ### H0 (model without random intercepts) ###
##D H0_code <-
##D "data {
##D   int<lower = 1> N;
##D   int<lower = 0, upper = 1> y[N];
##D   real<lower = 0> x[N];
##D }
##D parameters {
##D   real alpha0_raw;
##D   real alpha1_raw;
##D }
##D transformed parameters {
##D   real alpha0 = sqrt(10.0) * alpha0_raw;
##D   real alpha1 = sqrt(10.0) * alpha1_raw;
##D }
##D model {
##D   // priors
##D   target += normal_lpdf(alpha0_raw | 0, 1);
##D   target += normal_lpdf(alpha1_raw | 0, 1);
##D 
##D   // likelihood
##D   for (i in 1:N) {
##D     target += bernoulli_lpmf(y[i] | Phi(alpha0 + alpha1 * x[i]));
##D   }
##D }"
##D 
##D ### H1 (model with random intercepts) ###
##D H1_code <-
##D "data {
##D   int<lower = 1> N;
##D   int<lower = 0, upper = 1> y[N];
##D   real<lower = 0> x[N];
##D   int<lower = 1> C;
##D   int<lower = 1, upper = C> clutch[N];
##D }
##D parameters {
##D   real alpha0_raw;
##D   real alpha1_raw;
##D   vector[C] b_raw;
##D   real<lower = 0> sigma2;
##D }
##D transformed parameters {
##D   vector[C] b;
##D   real<lower = 0> sigma = sqrt(sigma2);
##D   real alpha0 = sqrt(10.0) * alpha0_raw;
##D   real alpha1 = sqrt(10.0) * alpha1_raw;
##D   b = sigma * b_raw;
##D }
##D model {
##D   // priors
##D   target += - 2 * log(1 + sigma2); // p(sigma2) = 1 / (1 + sigma2) ^ 2
##D   target += normal_lpdf(alpha0_raw | 0, 1);
##D   target += normal_lpdf(alpha1_raw | 0, 1);
##D 
##D   // random effects
##D   target += normal_lpdf(b_raw | 0, 1);
##D 
##D   // likelihood
##D   for (i in 1:N) {
##D     target += bernoulli_lpmf(y[i] | Phi(alpha0 + alpha1 * x[i] + b[clutch[i]]));
##D   }
##D }"
##D 
##D set.seed(1)
##D ### fit models ###
##D stanfit_H0 <- stan(model_code = H0_code,
##D                    data = list(y = turtles$y, x = turtles$x, N = nrow(turtles)),
##D                    iter = 15500, warmup = 500, chains = 4, seed = 1)
##D stanfit_H1 <- stan(model_code = H1_code,
##D                    data = list(y = turtles$y, x = turtles$x, N = nrow(turtles),
##D                                C = max(turtles$clutch), clutch = turtles$clutch),
##D                    iter = 15500, warmup = 500, chains = 4, seed = 1)
##D 
##D set.seed(1)
##D ### compute (log) marginal likelihoods ###
##D bridge_H0 <- bridge_sampler(stanfit_H0)
##D bridge_H1 <- bridge_sampler(stanfit_H1)
##D 
##D ### compute approximate percentage errors ###
##D error_measures(bridge_H0)$percentage
##D error_measures(bridge_H1)$percentage
##D 
##D ### summary ###
##D summary(bridge_H0)
##D summary(bridge_H1)
##D 
##D ### compute Bayes factor ("true" value: BF01 = 1.273) ###
##D bf(bridge_H0, bridge_H1)
##D 
## End(Not run)



