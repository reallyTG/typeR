library(TKF)


### Name: optim.phylo.wls
### Title: Phylogeny inference using the weighted least squares method
### Aliases: optim.phylo.wls
### Keywords: ~kwd1 ~kwd2

### ** Examples

  Dist <- matrix(c(0.00000, 27.78202, 29.54125, 29.06183, 40.63082, 41.20910,
                   27.78202, 0.00000, 14.82329, 24.26988, 47.40101, 43.76202,
                   29.54125, 14.82329, 0.00000, 26.82772, 48.17819, 41.27872,
                   29.06183, 24.26988, 26.82772, 0.00000, 44.66941, 44.39078,
                   40.63082, 47.40101, 48.17819, 44.66941, 0.00000, 45.63394,
                   41.20910, 43.76202, 41.27872, 44.39078, 45.63394, 0.00000),
                   ncol=6, dimnames=list(c("YARLI", "KLULA", "CANGA", "DEBHA",
                   "CRYNE", "ASPFU"), c("YARLI", "KLULA", "CANGA", "DEBHA",
                   "CRYNE", "ASPFU")))
  Var <- matrix(c(0.000000, 6.261368, 6.816608, 6.660132, 11.361800, 12.037978,
                  6.261368, 0.000000, 2.877505, 5.054447, 14.315551, 12.734813,
                  6.816608, 2.877505, 0.000000, 5.699967, 12.638321, 11.598558,
                  6.660132, 5.054447, 5.699967, 0.000000, 12.189609, 13.185733,
                  11.36180, 14.31555, 12.63832, 12.18961, 0.00000, 15.19872,
                  12.03798, 12.73481, 11.59856, 13.18573, 15.19872, 0.00000),
                  ncol=6, dimnames=list(c("YARLI", "KLULA", "CANGA", "DEBHA",
                   "CRYNE", "ASPFU"), c("YARLI", "KLULA", "CANGA", "DEBHA",
                   "CRYNE", "ASPFU")))
  tree <- optim.phylo.wls(Dist, Var)
  plot(tree, type="unrooted")




