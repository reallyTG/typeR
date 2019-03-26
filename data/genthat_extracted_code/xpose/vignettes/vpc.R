## ---- include = FALSE----------------------------------------------------
library(xpose)

knitr::opts_chunk$set(fig.dpi    = 96,
                      fig.align  = 'center', 
                      fig.height = 4, 
                      fig.width  = 6,
                      out.width  = '75%',
                      comment    = '',
                      message    = FALSE)

## ------------------------------------------------------------------------
xpdb_ex_pk %>% 
 vpc_data() %>%  # Compute the vpc data
 vpc()            # Plot the vpc

## ---- warning = FALSE----------------------------------------------------
xpdb_w_vpc <- vpc_data(xpdb_ex_pk) # Compute and store VPC data

xpdb_w_vpc # The vpc data is now listed under the xpdb "special" data

vpc(xpdb_w_vpc) # Plot the vpc from the stored data

## ---- warning = FALSE----------------------------------------------------
xpdb_w_multi_vpc <- xpdb_ex_pk %>% 
 vpc_data(vpc_type = 'continuous', opt = vpc_opt(n_bins = 6, lloq = 0.1)) %>% 
 vpc_data(vpc_type = 'censored', opt = vpc_opt(n_bins = 6, lloq = 0.1))

vpc(xpdb_w_multi_vpc, vpc_type = 'continuous')
vpc(xpdb_w_multi_vpc, vpc_type = 'censored')

## ---- warning = FALSE----------------------------------------------------
xpdb_ex_pk %>% 
 vpc_data(vpc_type = 'censored', stratify = 'SEX',
          opt = vpc_opt(bins = 'jenks', n_bins = 7, lloq = 0.5)) %>% 
 vpc()

## ------------------------------------------------------------------------
# View the xpdb content and data problems
xpdb_ex_pk

# Generate the vpc
xpdb_ex_pk %>% 
 vpc_data(vpc_type = 'continuous', obs_problem = 1, sim_problem = 2) %>% 
 vpc()

## ---- eval = FALSE-------------------------------------------------------
#  xpdb_ex_pk %>%
#   vpc_data(psn_folder = '@dir/run001_vpc', psn_bins = TRUE) %>%
#   vpc()

