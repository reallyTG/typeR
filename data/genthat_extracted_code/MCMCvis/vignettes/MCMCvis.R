## ---- eval = FALSE-------------------------------------------------------
#  library(rjags)
#  
#  #create JAGS model
#  mf <- "
#  model {
#  for (i in 1:10)
#  {
#    y[i] ~ dnorm(mu, 0.01);
#  }
#  mu ~ dnorm(0, 0.01)
#  }
#  "
#  
#  data <- list(y = rnorm(10))
#  
#  jm <- rjags::jags.model(textConnection(mf),
#                          data = data,
#                          n.chains = 3)
#  
#  jags_out <- rjags::coda.samples(jm,
#                                   variable.names = 'mu',
#                                   n.iter = 500)

## ------------------------------------------------------------------------
library(MCMCvis)

## ---- eval = FALSE-------------------------------------------------------
#  #plug object directly into package function
#  MCMCsummary(jags_out, round = 2)

## ---- eval = FALSE-------------------------------------------------------
#  ##     mean   sd  2.5%   50% 97.5% Rhat
#  ## mu -0.46 3.09 -6.32 -0.51  5.44    1

## ---- eval = FALSE-------------------------------------------------------
#  library(rstan)
#  
#  #create Stan model
#  
#  sm <- "
#  data {
#  real y[10];
#  }
#  parameters {
#  real mu;
#  }
#  model {
#  for (i in 1:10)
#  {
#    y[i] ~ normal(mu, 10);
#  }
#  mu ~ normal(0, 10);
#  }
#  "
#  
#  stan_out <- stan(model_code = sm,
#                    data = data,
#                    iter = 500)

## ---- eval = FALSE-------------------------------------------------------
#  #plug object directly into package function
#  MCMCsummary(stan_out, round = 2)

## ---- eval = FALSE-------------------------------------------------------
#  ##       mean   sd  2.5%   50% 97.5% Rhat
#  ## mu   -0.48 2.91 -6.07 -0.35  5.39 1.01
#  ## lp__ -0.56 0.68 -2.42 -0.28 -0.09 1.00

## ---- message=FALSE------------------------------------------------------
data(MCMC_data)

MCMCsummary(MCMC_data)

## ---- message=FALSE------------------------------------------------------

MCMCsummary(MCMC_data, round = 2)

## ------------------------------------------------------------------------
MCMCsummary(MCMC_data, 
          params = 'alpha', 
          digits = 2)

## ------------------------------------------------------------------------
MCMCsummary(MCMC_data, 
          params = 'alpha\\[1\\]', 
          ISB = FALSE,
          round = 2)

## ------------------------------------------------------------------------
MCMCsummary(MCMC_data, 
          params = 'alpha',
          excl = 'alpha\\[1\\]', 
          ISB = FALSE,
          round = 2)

## ------------------------------------------------------------------------
MCMCsummary(MCMC_data, 
          params = 'alpha',
          Rhat = TRUE,
          n.eff = TRUE,
          round = 2)

## ------------------------------------------------------------------------
MCMCsummary(MCMC_data, 
          params = 'alpha',
          Rhat = TRUE,
          n.eff = TRUE,
          func = function(x) quantile(x, probs = c(0.01, 0.99)),
          func_name = c('1%', '99%'),
          round = 2)

## ---- fig.width=5, fig.height=6------------------------------------------
MCMCpstr(MCMC_data,
         params = 'alpha',
         func = mean,
         type = 'summary')

## ---- fig.width=5, fig.height=6------------------------------------------
MCMCpstr(MCMC_data, 
         func = function(x) quantile(x, probs = c(0.01, 0.99)))

## ------------------------------------------------------------------------
ex <- MCMCpstr(MCMC_data, type = 'chains')

dim(ex$alpha)

## ---- fig.width=5, fig.height=6------------------------------------------
MCMCtrace(MCMC_data, 
        params = c('beta\\[1\\]', 'beta\\[2\\]', 'beta\\[3\\]'),
        ISB = FALSE,
        pdf = FALSE)

## ---- fig.width=5, fig.height=6------------------------------------------
MCMCtrace(MCMC_data, 
        params = 'beta',
        type = 'density',
        ind = TRUE, 
        pdf = FALSE)

## ---- eval=FALSE---------------------------------------------------------
#  MCMCtrace(MCMC_data,
#          pdf = TRUE,
#          open_pdf = FALSE,
#          filename = 'MYpdf',
#          wd = 'DIRECTORY_HERE')

## ---- fig.width=5, fig.height=6------------------------------------------
MCMCtrace(MCMC_data, 
        params = c('beta\\[1\\]', 'beta\\[2\\]', 'beta\\[3\\]'),
        ISB = FALSE,
        iter = 100,
        ind = TRUE,
        pdf = FALSE)

## ---- fig.width=5, fig.height=6------------------------------------------
#same prior used for all parameters
PR <- rnorm(15000, 0, 32) #equivalent to dnorm(0, 0.001) in JAGS
MCMCtrace(MCMC_data,
          params = c('beta\\[1\\]', 'beta\\[2\\]', 'beta\\[3\\]'),
          ISB = FALSE,
          priors = PR,
          pdf = FALSE,
          Rhat = TRUE,
          n.eff = TRUE)

## ---- fig.width=5, fig.height=6------------------------------------------
#same prior used for all parameters
PR <- rnorm(15000, 0, 32) #equivalent to dnorm(0, 0.001) in JAGS
PPO <- MCMCtrace(MCMC_data, 
                 params = c('beta\\[1\\]', 'beta\\[2\\]', 'beta\\[3\\]'),
                 ISB = FALSE,
                 priors = PR,
                 pdf = FALSE,
                 post_zm = FALSE,
                 PPO_out = TRUE)

PPO

## ---- fig.width=5, fig.height=6------------------------------------------
#same prior used for all parameters
PR <- rnorm(15000, 0, 32) #equivalent to dnorm(0, 0.001) in JAGS
MCMCtrace(MCMC_data,
          params = c('beta\\[1\\]', 'beta\\[2\\]', 'beta\\[3\\]'),
          ISB = FALSE,
          priors = PR,
          pdf = FALSE,
          Rhat = TRUE,
          n.eff = TRUE,
          xlab_tr = 'This is the x for trace',
          ylab_tr = 'This is the y for trace',
          main_den = 'Custom density title',
          lwd_den = 3,
          lty_pr = 2,
          col_pr = 'green',
          sz_txt = 1.3,
          sz_ax = 2,
          sz_ax_txt = 1.2,
          sz_tick_txt = 1.2,
          sz_main_txt = 1.3)

## ---- fig.width=5, fig.height=6------------------------------------------
#generating values for each parameter used to simulate data
GV <- c(-10, -5.5, -15)
MCMCtrace(MCMC_data,
          params = c('beta\\[1\\]', 'beta\\[2\\]', 'beta\\[3\\]'),
          ISB = FALSE,
          gvals = GV,
          pdf = FALSE)

## ------------------------------------------------------------------------
ex <- MCMCchains(MCMC_data, 
               params = 'beta')

#extract mean values for each parameter
apply(ex, 2, mean)

## ------------------------------------------------------------------------
ex2 <- MCMCchains(MCMC_data, 
                  params = 'beta', 
                  mcmc.list = TRUE)

## ---- fig.width=5, fig.height=6------------------------------------------
MCMCplot(MCMC_data, 
       params = 'beta')

## ---- fig.width=5, fig.height=6------------------------------------------
MCMCplot(MCMC_data, 
       params = 'beta',
       ref_ovl = TRUE)

## ---- fig.width=5, fig.height=6------------------------------------------
MCMCplot(MCMC_data, 
       params = 'beta', 
       rank = TRUE,
       xlab = 'ESTIMATE')

## ---- fig.width=5, fig.height=6------------------------------------------
MCMCplot(MCMC_data, 
       params = 'beta', 
       rank = TRUE,
       horiz = FALSE,
       ylab = 'ESTIMATE')

## ---- fig.width=5, fig.height=6------------------------------------------
MCMCplot(MCMC_data, 
       params = 'beta', 
       xlim = c(-60, 40),
       xlab = 'My x-axis label',
       main = 'MCMCvis plot',
       labels = c('First param', 'Second param', 'Third param', 
                  'Fourth param', 'Fifth param', 'Sixth param'), 
       col = 'red',
       sz_labels = 1.5,
       sz_med = 2,
       sz_thick = 7,
       sz_thin = 3,
       sz_ax = 4,
       sz_main_txt = 2)

