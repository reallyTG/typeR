library(psychmeta)


### Name: create_ad_group
### Title: Generate an artifact distribution object for a dichotomous
###   grouping variable.
### Aliases: create_ad_group

### ** Examples

## Example artifact distribution for a dichotomous grouping variable:
create_ad_group(rGg = c(.8, .9, .95), n_rGg = c(100, 200, 250),
                mean_rGg = .9, var_rGg = .05,
                k_rGg = 5, mean_n_rGg = 100,
                pi = c(.6, .55, .3), pa = .5, n_pi = c(100, 200, 250), n_pa = c(300, 300, 300),
                var_unbiased = TRUE)
                
create_ad_group(ad_type = "int", rGg = c(.8, .9, .95), n_rGg = c(100, 200, 250),
                mean_rGg = .9, var_rGg = .05,
                k_rGg = 5, mean_n_rGg = 100,
                pi = c(.6, .55, .3), pa = .5, n_pi = c(100, 200, 250), n_pa = c(300, 300, 300),
                var_unbiased = TRUE)



