library(popdemo)


### Name: stoch
### Title: Project population dynamics
### Aliases: stoch

### ** Examples

  # load the Polar bear data
  ( data(Pbear) )

  # Find the stochastic growth for a time series with uniform probability of each
  # matrix
  ( lambda_unif <- stoch(Pbear, what = "lambda", Aseq = "unif") )

  # Find the variance in stochastic growth for a time series with uniform 
  # probability of each matrix
  ( var_unif <- stoch(Pbear, what = "var", Aseq = "unif") )
                 
  # Find stochastic growth and its variance for a time series with a sequence of
  # matrices where "bad" years happen with probability q
  q <- 0.5
  prob_seq <- c(rep(1-q,3)/3, rep(q,2)/2)
  Pbear_seq <- matrix(rep(prob_seq,5), 5, 5)
  ( var_unif <- stoch(Pbear, what = "var", Aseq = Pbear_seq) )
  



