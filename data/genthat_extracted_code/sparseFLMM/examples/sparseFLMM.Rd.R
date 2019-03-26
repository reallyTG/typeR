library(sparseFLMM)


### Name: sparseFLMM
### Title: Functional Linear Mixed Models for Irregularly or Sparsely
###   Sampled Data
### Aliases: sparseFLMM
### Keywords: FPCA models,

### ** Examples

## Not run: 
##D # subset of acoustic data (very small subset, no meaningful results can be expected and
##D # FAMM estimation does not work for this subset example. For FAMM estimation, see below.)
##D data("acoustic_subset")
##D 
##D acoustic_results <- sparseFLMM(curve_info = acoustic_subset, use_RI = FALSE, use_simple = FALSE,
##D               method = "fREML", use_bam = TRUE, bs = "ps", d_grid = 100, min_grid = 0,
##D               max_grid = 1, my_grid = NULL, bf_mean = 8, bf_covariates = 8, m_mean = c(2,3),
##D               covariate = TRUE, num_covariates = 4, covariate_form = rep("by", 4),
##D               interaction = TRUE,
##D               which_interaction = matrix(c(FALSE, TRUE, TRUE, TRUE, TRUE,
##D               FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, TRUE, FALSE,
##D               FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE),
##D               byrow = TRUE, nrow = 4, ncol = 4),
##D               save_model_mean = FALSE, para_estim_mean = FALSE, para_estim_mean_nc = 0,
##D               bf_covs = c(5, 5, 5), m_covs = list(c(2, 3), c(2, 3), c(2, 3)),
##D               use_whole = FALSE, use_tri = FALSE, use_tri_constr = TRUE,
##D               use_tri_constr_weights = FALSE, np = TRUE, mp = TRUE,
##D               use_discrete_cov = FALSE,
##D               para_estim_cov = FALSE, para_estim_cov_nc = 5,
##D               var_level = 0.95, N_B = NA, N_C = NA, N_E = NA,
##D               use_famm = FALSE, use_bam_famm = TRUE,
##D               bs_int_famm = list(bs = "ps", k = 8, m = c(2, 3)),
##D               bs_y_famm = list(bs = "ps", k = 8, m = c(2, 3)),
##D               save_model_famm = FALSE, use_discrete_famm = FALSE,
##D               para_estim_famm = FALSE, para_estim_famm_nc = 0)
## End(Not run)

## Not run: 
##D # whole data set with estimation in the FAMM framework
##D 
##D data("acoustic")
##D acoustic_results <- sparseFLMM(curve_info = acoustic, use_RI = FALSE, use_simple = FALSE,
##D               method = "fREML", use_bam = TRUE, bs = "ps", d_grid = 100, min_grid = 0,
##D               max_grid = 1, my_grid = NULL, bf_mean = 8, bf_covariates = 8, m_mean = c(2,3),
##D               covariate = TRUE, num_covariates = 4, covariate_form = rep("by", 4),
##D               interaction = TRUE,
##D               which_interaction = matrix(c(FALSE, TRUE, TRUE, TRUE, TRUE,
##D               FALSE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE, TRUE, FALSE,
##D               FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE, FALSE),
##D               byrow = TRUE, nrow = 4, ncol = 4),
##D               save_model_mean = FALSE, para_estim_mean = FALSE, para_estim_mean_nc = 0,
##D               bf_covs = c(5, 5, 5), m_covs = list(c(2, 3), c(2, 3), c(2, 3)),
##D               use_whole = FALSE, use_tri = FALSE, use_tri_constr = TRUE,
##D               use_tri_constr_weights = FALSE, np = TRUE, mp = TRUE,
##D               use_discrete_cov = FALSE,
##D               para_estim_cov = TRUE, para_estim_cov_nc = 5,
##D               var_level = 0.95, N_B = NA, N_C = NA, N_E = NA,
##D               use_famm = TRUE, use_bam_famm = TRUE,
##D               bs_int_famm = list(bs = "ps", k = 8, m = c(2, 3)),
##D               bs_y_famm = list(bs = "ps", k = 8, m = c(2, 3)),
##D               save_model_famm = FALSE, use_discrete_famm = FALSE,
##D               para_estim_famm = TRUE, para_estim_famm_nc = 5)
## End(Not run)




