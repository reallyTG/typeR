library(breathtestcore)


### Name: t50_bluck_coward
### Title: Bluck-Coward self-corrected half-emptying time
### Aliases: t50_bluck_coward

### ** Examples

# From table 3 and 4 in Bluck et al.; values for \code{k} and \code{beta} 
# (nls, bayesian) are entered and checked against the tabulated values of 
# t_{1/2(in)}.
# Most errors are small, but there are some outliers; errors in paper table?
# Parameters and Bluck et al. results:
# table 3 of Bluck et al.
cf3 = data.frame(
          method = rep(c("nls", "bayesian")),
          group = rep(c("lean", "obese"),each=2),
          k =    c(0.576,0.606,0.529,0.608),
          beta = c(5.24, 5.79, 5.95, 7.54),
          t12 =  c(3.67, 3.63, 4.23, 3.99),
          t12in = c(2.076, 2.110, 2.422, 2.466),
          tlag = c(2.88, 2.88, 3.34, 3.26),
          tlagin = c(1.632, 1.724, 1.92, 2.101)
)
cf3 = dplyr::mutate(cf3,
          t50_maes_ghoos = t50_maes_ghoos(cf3),
          t50_bluck_coward = t50_bluck_coward(cf3),
          tlag_maes_ghoos = tlag_maes_ghoos(cf3),
          tlag_bluck_coward = tlag_bluck_coward(cf3),
          err_t50_maes_ghoos = round(100*(t50_maes_ghoos-t12)/t12, 2),
          err_t50_bluck_coward =
            round(100*(t50_bluck_coward-t12in)/t12in, 2),
          err_lag_maes = round(100*(tlag_maes_ghoos-tlag)/tlag,2),
          err_lag_bluck_coward =
            round(100*(tlag_bluck_coward-tlagin)/tlagin,2)
)
cf3
# table 4
# there are large differences for mj3, both using the bayesian (26%)
# and the nls method (16%).  The other data are within the expected limits
cf4 = data.frame(
          method = rep(c("nls", "bayesian"),each=3),
          group = rep(c("mj1",   "mj2",   "mj3")),  
          k = c(0.585,  0.437,  0.380,  0.588,  0.418,  0.361),  
          beta=c(4.35,  4.08,  4.44,  4.49, 4.30, 4.29), 
          t12 = c(3.39, 4.25, 4.82, 3.40, 4.61, 5.09), 
          t12in = c(1.77, 2.16, 2.19, 1.81, 2.34, 2.43), 
          tlag = c(2.56, 3.17, 3.39, 2.58, 3.40, 3.62), 
          tlagin = c(1.30, 1.53, 1.33, 1.35, 1.65, 1.57)
)
cf4 = dplyr::mutate(cf4,
          t50_maes_ghoos = t50_maes_ghoos(cf4),
          t50_bluck_coward = t50_bluck_coward(cf4),
          tlag_maes_ghoos = tlag_maes_ghoos(cf4),
          tlag_bluck_coward = tlag_bluck_coward(cf4),
          err_t50_maes_ghoos = unlist(round(100*(t50_maes_ghoos-t12)/t12)),
          err_t50_bluck_coward =
            round(100*(t50_bluck_coward-t12in)/t12in,2),
          err_lag_maes = round(100*(tlag_maes_ghoos-tlag)/tlag,2),
          err_lag_bluck_coward =
            round(100*(tlag_bluck_coward-tlagin)/tlagin,2)
)
cf4




