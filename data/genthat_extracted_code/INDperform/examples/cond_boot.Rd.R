library(INDperform)


### Name: cond_boot
### Title: Conditional bootstraps
### Aliases: cond_boot

### ** Examples

## No test: 
 # Using some models of the Baltic Sea demo data
 init_tbl <- ind_init_ex[ind_init_ex$id %in% c(5,9,75), ]
 mod_tbl <- merge_models_ex[merge_models_ex$id  %in% c(5,9,75), ]
 deriv_tbl <- cond_boot(mod_tbl = mod_tbl, init_tbl = init_tbl,
			excl_outlier = TRUE, n_boot = 200,	ci = 0.95,
			par_comp = FALSE, no_clust = NULL, seed = NULL)
## End(No test)



