library(forestmangr)


### Name: nls_table
### Title: Fit non-linear regressions by group, using LM algorithm and get
###   different output options.
### Aliases: nls_table

### ** Examples

library(forestmangr)
library(dplyr)
data("exfm14")
exfm14

# Fit Chapman & Richards non-linear model for dominant Height:
nls_table(exfm14, dh ~ b0 * (1 - exp( -b1 * age )  )^b2, 
          mod_start = c( b0=23, b1=0.03, b2 = 1.3  ) )

# Fit CR model by strata:
nls_table(exfm14,dh ~ b0 * (1 - exp( -b1 * age )  )^b2,
          mod_start = c( b0=23, b1=0.03, b2 = 1.3  ),
          .groups = "strata") %>% 
          as.data.frame
          
# or, using group_by

exfm14 %>% 
group_by(strata) %>% 
nls_table(dh ~ b0 * (1 - exp( -b1 * age )  )^b2,
          mod_start = c( b0=23, b1=0.03, b2 = 1.3  ) )

# If there are multiple start values, for each strata, they can be supplied like so:
tab_coef <- data.frame(strata = c(1:20, 24,25,27,28,30,31,33,35,36,37), 
              rbind(
              data.frame(b0 = rep(23, 20), b1 = rep(0.03, 20), b2 = rep(1.3, 20) ), 
              data.frame(b0 = rep(23, 10), b1 = rep(0.03, 10), b2 = rep(.5, 10) )))

tab_coef

nls_table(exfm14, dh ~ b0 * (1 - exp( -b1 * age )  )^b2, 
          mod_start = tab_coef,
          .groups = "strata" )
# mod_start needs to be a data frame in this case.

# It's possible to bind the coefficients to the original data,
# to estimate y. We'll also estimate bias and rmse for this estimation:
nls_table(exfm14,dh ~ b0 * (1 - exp( -b1 * age )  )^b2, 
          mod_start = tab_coef ,
          .groups = "strata", 
          replace = TRUE,
          output = "merge" ) %>% 
  mutate(
  dh_est = b0 * (1 - exp( -b1 * age )  )^b2,
  bias = bias_per(y = dh, yhat = dh_est),
  rmse = rmse_per(y = dh, yhat = dh_est) ) %>% 
  head(15)

# This can also be done directly using "merge_est" as output:
nls_table(exfm14,dh ~ b0 * (1 - exp( -b1 * age )  )^b2, 
          mod_start = tab_coef ,
          .groups = "strata", 
          output = "merge_est", 
          est.name = "dh_est" ) %>% 
  mutate(
  bias = bias_per(y = dh, yhat = dh_est),
  rmse = rmse_per(y = dh, yhat = dh_est) ) %>% 
  head(15)

# It's possible to further customize the output, using nested columns:
nls_table(exfm14,dh ~ b0 * (1 - exp( -b1 * age )  )^b2, 
          mod_start = tab_coef ,
          .groups = "strata",
          output = "nest" ) 
             
# It's possible to use Gauss-Newton's algorithm. In this case,
# some regressions will not converge.            
 exfm14 %>% 
group_by(strata) %>% 
nls_table(dh ~ b0 * (1 - exp( -b1 * age )  )^b2,
          mod_start = c( b0=23, b1=0.03, b2 = 1.3  ),algorithm="GN" )
         
# If some regressions don't converge, it's possible to fill those NAs with
# regression coefficients from a general fit, using the entire data: 
nls_table(exfm14,dh ~ b0 * (1 - exp( -b1 * age )  )^b2, 
          mod_start = c( b0=23, b1=0.03, b2 = 1.3  ),
          .groups = "strata",
          replace = TRUE,
          algorithm="GN" )




