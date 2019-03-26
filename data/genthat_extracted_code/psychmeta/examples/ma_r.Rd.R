library(psychmeta)


### Name: ma_r
### Title: Meta-analysis of correlations
### Aliases: ma_r ma_r_ad ma_r_bb ma_r_barebones ma_r_ic

### ** Examples

## Not run: 
##D ## The 'ma_r' function can compute multi-construct bare-bones meta-analyses:
##D ma_obj <- ma_r(rxyi = rxyi, n = n, rxx = rxxi, ryy = ryyi,
##D      construct_x = x_name, construct_y = y_name, sample_id = sample_id,
##D      moderators = moderator, data = data_r_meas_multi)
##D summary(ma_obj)
##D 
##D ## It can also perform multiple individual-correction meta-analyses:
##D ma_obj <- ma_r(ma_method = "ic", rxyi = rxyi, n = n, rxx = rxxi, ryy = ryyi,
##D                construct_x = x_name, construct_y = y_name, sample_id = sample_id,
##D                moderators = moderator, data = data_r_meas_multi)
##D summary(ma_obj)
##D ma_obj$meta_tables[[1]]$individual_correction$true_score
##D 
##D ## And 'ma_r' can also curate artifact distributions and compute multiple
##D ## artifact-distribution meta-analyses:
##D ma_obj <- ma_r(ma_method = "ad", ad_type = "int", rxyi = rxyi, n = n, rxx = rxxi, ryy = ryyi,
##D                correct_rr_x = FALSE, correct_rr_y = FALSE,
##D                construct_x = x_name, construct_y = y_name, sample_id = sample_id,
##D                clean_artifacts = FALSE, impute_artifacts = FALSE,
##D                moderators = moderator, data = data_r_meas_multi)
##D summary(ma_obj)
##D ma_obj$meta_tables[[1]]$artifact_distribution$true_score
##D 
##D ## Even if no studies in the database provide artifact information,
##D ## pre-specified artifact distributions from previous meta-analyses
##D ## can still be used! (These results should match the previous example.)
##D ma_obj <- ma_r(ma_method = "ad", rxyi = rxyi, n = n,
##D                correct_rr_x = FALSE, correct_rr_y = FALSE,
##D                construct_x = x_name, construct_y = y_name, sample_id = sample_id,
##D                clean_artifacts = FALSE, impute_artifacts = FALSE,
##D                moderators = moderator, data = data_r_meas_multi,
##D                supplemental_ads =
##D                     list(X = list(mean_qxi = 0.8927818, var_qxi = 0.0008095520, k_qxi = 40,
##D                                   mean_n_qxi = 11927 / 40, qxi_dist_type = "alpha"),
##D                          Y = list(mean_qxi = 0.8941266, var_qxi = 0.0009367234, k_qxi = 40,
##D                                   mean_n_qxi = 11927 / 40, qxi_dist_type = "alpha"),
##D                          Z = list(mean_qxi = 0.8962108, var_qxi = 0.0007840593, k_qxi = 40,
##D                                   mean_n_qxi = 11927 / 40, qxi_dist_type = "alpha")))
##D summary(ma_obj)
##D ma_obj$meta_tables[[1]]$artifact_distribution$true_score
##D 
##D ## Artifact information may also be supplied by passing "ad_obj" class objects with the
##D ## "supplemental_ads" argument.
##D ## Create a list of artifact-distribution objects:
##D ad_list <- create_ad_list(n = n, rxx = rxxi, ryy = ryyi,
##D                           construct_x = x_name, construct_y = y_name,
##D                           sample_id = sample_id,
##D                           data = data_r_meas_multi)
##D ad_list <- setNames(ad_list$ad_x, ad_list$construct_x)
##D 
##D ## Run the artifact-distribution meta-analysis:
##D ma_obj <- ma_r(ma_method = "ad", rxyi = rxyi, n = n,
##D                correct_rr_x = FALSE, correct_rr_y = FALSE,
##D                construct_x = x_name, construct_y = y_name, sample_id = sample_id,
##D                clean_artifacts = FALSE, impute_artifacts = FALSE,
##D                moderators = moderator, data = data_r_meas_multi,
##D                supplemental_ads = ad_list)
##D summary(ma_obj)
##D ma_obj$meta_tables[[1]]$artifact_distribution$true_score
##D 
##D 
##D ## Artifact information from studies not included in the meta-analysis can also be used to make
##D ## corrections. Passing artifact information with the 'supplemental_ads' argument allows for
##D ## additional artifact values and/or means and variances of artifacts to be used.
##D ## The 'supplemental_ads' analysis below gives the same results as the prior meta-analysis.
##D x_ids <- c(data_r_meas_multi$x_name, data_r_meas_multi$y_name) == "X"
##D rxxi <- c(data_r_meas_multi$rxxi, data_r_meas_multi$ryyi)[x_ids]
##D n_rxxi = c(data_r_meas_multi$n, data_r_meas_multi$n)[x_ids]
##D 
##D y_ids <- c(data_r_meas_multi$x_name, data_r_meas_multi$y_name) == "Y"
##D ryyi <- c(data_r_meas_multi$rxxi, data_r_meas_multi$ryyi)[y_ids]
##D n_ryyi = c(data_r_meas_multi$n, data_r_meas_multi$n)[y_ids]
##D 
##D z_ids <- c(data_r_meas_multi$x_name, data_r_meas_multi$y_name) == "Z"
##D rzzi <- c(data_r_meas_multi$rxxi, data_r_meas_multi$ryyi)[z_ids]
##D n_rzzi = c(data_r_meas_multi$n, data_r_meas_multi$n)[z_ids]
##D 
##D ma_obj <- ma_r(ma_method = "ad", rxyi = rxyi, n = n,
##D                correct_rr_x = FALSE, correct_rr_y = FALSE,
##D                construct_x = x_name, construct_y = y_name,
##D                moderators = moderator, sample_id = sample_id, data = data_r_meas_multi,
##D                supplemental_ads = list(X = list(rxxi = rxxi, n_rxxi = n_rxxi, wt_rxxi = n_rxxi),
##D                                        Y = list(rxxi = ryyi, n_rxxi = n_ryyi, wt_rxxi = n_ryyi),
##D                                        Z = list(rxxi = rzzi, n_rxxi = n_rzzi, wt_rxxi = n_rzzi)))
##D summary(ma_obj)
##D ma_obj$meta_tables[[1]]$artifact_distribution$true_score
##D 
##D ## If 'use_all_arts' is set to TRUE, artifacts from studies without valid correlations
##D ## will be used to inform artifact distributions. Below, correlations and artifacts
##D ## are provided by non-overlapping sets of studies.
##D dat1 <- dat2 <- data_r_meas_multi
##D dat1$rxxi <- dat1$ryyi <- NA
##D dat2$rxyi <- NA
##D dat2$sample_id <- dat2$sample_id + 40
##D dat <- rbind(dat1, dat2)
##D ma_obj <- ma_r(ma_method = "ad", rxyi = rxyi, n = n, rxx = rxxi, ryy = ryyi,
##D                correct_rr_x = FALSE, correct_rr_y = FALSE,
##D                construct_x = x_name, construct_y = y_name,
##D                sample_id = sample_id, moderators = moderator,
##D                use_all_arts = TRUE, data = dat)
##D summary(ma_obj)
##D ma_obj$meta_tables[[1]]$artifact_distribution$true_score
##D 
##D 
##D 
##D ### Demonstration of ma_r_bb ###
##D ## Example analysis using data from Gonzalez-Mule et al. (2014):
##D 
##D ## Not correcting for bias and using normal distributions to compute uncertainty intervals
##D ## allows for exact replication of the results reported in the text:
##D ma_r_bb(r = rxyi, n = n, correct_bias = FALSE, conf_method = "norm", cred_method = "norm",
##D                data = data_r_gonzalezmule_2014)
##D 
##D ## Using hs_override = TRUE allows one to easily implement the traditional Hunter-Schmidt method:
##D ma_r_bb(r = rxyi, n = n, hs_override = TRUE, data = data_r_gonzalezmule_2014)
##D 
##D ## With hs_override = FALSE, the program defaults will compute unbiased variances and use
##D ## t-distributions to estimate confidence and credibility intervals - these settings make
##D ## a noticeable difference for small studies like the textbook example:
##D ma_r_bb(r = rxyi, n = n, hs_override = FALSE, data = data_r_gonzalezmule_2014)
##D 
##D 
##D 
##D ### Demonstration of ma_r_ic ###
##D ## Simulated example satisfying the assumptions of the Case IV 
##D ## range-restriction correction (parameter values: mean_rho = .3, sd_rho = .15):
##D ma_r_ic(rxyi = rxyi, n = n, rxx = rxxi, ryy = ryyi, ux = ux, data = data_r_uvirr)
##D 
##D ## Simulated example satisfying the assumptions of the Case V 
##D ## range-restriction correction
##D ma_r_ic(rxyi = rxyi, n = n, rxx = rxxi, ryy = ryyi, 
##D         rxx_type = "parallel", ryy_type = "parallel", 
##D         ux = ux, uy = uy, data = data_r_bvirr)
##D 
##D ## Published example from Gonzalez-Mule et al. (2014)
##D ma_r_ic(rxyi = rxyi, n = n, hs_override = TRUE, data = data_r_gonzalezmule_2014,
##D         rxx = rxxi, ryy = ryyi, ux = ux, indirect_rr_x = TRUE,
##D         moderators = c("Rating source", "Published", "Type", "Complexity"))
##D         
##D         
##D 
##D ### Demonstration of ma_r_ad ###
##D ## Compute barebones meta-analysis
##D ma_obj <- ma_r_bb(r = rxyi, n = n, correct_bias = FALSE,
##D                            conf_method = "norm", cred_method = "norm", data = data_r_mcdaniel_1994)
##D 
##D ## Construct artifact distribution for X
##D ad_obj_x <- create_ad(ad_type = "tsa", mean_rxxi = data_r_mcdaniel_1994$Mrxxi[1],
##D                       var_rxxi = data_r_mcdaniel_1994$SDrxxi[1]^.5,
##D                       ux = data_r_mcdaniel_1994$ux,
##D                       wt_ux = data_r_mcdaniel_1994$`ux frequency`)
##D 
##D ## Construct artifact distribution for Y
##D ad_obj_y <- create_ad(ad_type = "tsa", rxxi = data_r_mcdaniel_1994$ryyi,
##D                       wt_rxxi = data_r_mcdaniel_1994$`ryyi frequency`)
##D 
##D ## Compute artifact-distribution meta-analysis, correcting for measurement error only
##D ma_r_ad(ma_obj = ma_obj, ad_obj_x = ad_obj_x, ad_obj_y = ad_obj_y, correction_method = "meas")
##D 
##D ## Compute artifact-distribution meta-analysis, correcting for univariate direct range restriction
##D ma_r_ad(ma_obj = ma_obj, ad_obj_x = ad_obj_x, ad_obj_y = ad_obj_y, correction_method = "uvdrr",
##D         correct_rr_y = FALSE, indirect_rr_x = FALSE)
##D         
##D         
##D # The results of ma_r() can also be corrected using artifact distributions
##D ma_obj <- ma_r(ma_method = "bb", rxyi = rxyi, n = n,
##D                construct_x = x_name, construct_y = y_name, sample_id = sample_id,
##D                moderators = moderator, data = data_r_meas_multi)
##D 
##D # The create_ad_list function can be used to generate batches of artifact-distribution objects.
##D # Here is an example in which one distribution is created per construct.
##D ad_tibble <- create_ad_list(n = n, rxx = rxxi, ryy = ryyi,
##D                             construct_x = x_name, construct_y = y_name,
##D                             sample_id = sample_id,
##D                             data = data_r_meas_multi)
##D # Passing that collection of distributions to ma_r_ad() corrects 'ma_obj' for artifacts:  
##D ma_obj_tibble <- ma_r_ad(ma_obj = ma_obj, 
##D                          ad_obj_x = ad_tibble, ad_obj_y = ad_tibble)
##D summary(ma_obj_tibble)
##D ma_obj_tibble$meta_tables[[1]]$artifact_distribution$true_score
##D 
##D 
##D # The same outcomes as the previous example can be achieved by passing a named list of
##D # artifact information, with each element bearing the name of a construct:
##D ad_list <- setNames(ad_tibble$ad_x, ad_tibble$construct_x)
##D ma_obj_list <- ma_r_ad(ma_obj = ma_obj, 
##D                        ad_obj_x = ad_list, ad_obj_y = ad_list)
##D summary(ma_obj_list)
##D ma_obj_list$meta_tables[[1]]$artifact_distribution$true_score
##D 
##D 
##D # It is also possible to construct artifact distributions in a pairwise fashion. 
##D # For example, if correlations between X and Y and between X and Z are being analyzed,
##D # X will get a different distribution for its relationships with Y than with Z.
##D # These pairwise distributions are based only on artifact data from specific construct pairs.
##D ad_tibble_pair <- create_ad_list(n = n, rxx = rxxi, ryy = ryyi,
##D                                  construct_x = x_name, construct_y = y_name,
##D                                  sample_id = sample_id,
##D                                  control = control_psychmeta(pairwise_ads = TRUE),
##D                                  data = data_r_meas_multi)
##D # Passing these pairwise distributions to ma_r_ad() corrects 'ma_obj' for artifacts:  
##D ma_obj_pair <- ma_r_ad(ma_obj = ma_obj, 
##D                        ad_obj_x = ad_tibble_pair, ad_obj_y = ad_tibble_pair)
##D summary(ma_obj_pair)
##D ma_obj_pair$meta_tables[[1]]$artifact_distribution$true_score
##D 
##D 
##D # Sometimes moderators have important influcnces on artifact distributions as well as
##D # distributions of effect sizes. When this occurs, moderated artifact distributions 
##D # can be created to make more appropriate corrections. 
##D ad_tibble_mod <- create_ad_list(n = n, rxx = rxxi, ryy = ryyi,
##D                                 construct_x = x_name, construct_y = y_name,
##D                                 sample_id = sample_id,
##D                                 control = control_psychmeta(moderated_ads = TRUE),
##D                                 moderators = moderator,
##D                                 data = data_r_meas_multi)
##D # Passing these moderated distributions to ma_r_ad() corrects 'ma_obj' for artifacts:  
##D ma_obj_mod <- ma_r_ad(ma_obj = ma_obj, 
##D                       ad_obj_x = ad_tibble_mod, ad_obj_y = ad_tibble_mod)
##D summary(ma_obj_mod)
##D ma_obj_mod$meta_tables[[1]]$artifact_distribution$true_score
##D 
##D 
##D # It is also possible to create pairwise moderated artifact distributions.
##D ad_tibble_pairmod <- create_ad_list(n = n, rxx = rxxi, ryy = ryyi,
##D                                     construct_x = x_name, construct_y = y_name,
##D                                     sample_id = sample_id,
##D                                     control = control_psychmeta(moderated_ads = TRUE,
##D                                                                 pairwise_ads = TRUE),
##D                                     moderators = moderator,
##D                                     data = data_r_meas_multi)
##D # Passing these pairwise moderated distributions to ma_r_ad() corrects 'ma_obj' for artifacts:  
##D ma_obj_pairmod <- ma_r_ad(ma_obj = ma_obj, 
##D                           ad_obj_x = ad_tibble_pairmod, ad_obj_y = ad_tibble_pairmod)
##D summary(ma_obj_pairmod)
##D ma_obj_pairmod$meta_tables[[1]]$artifact_distribution$true_score
##D 
##D 
##D # For even more control over which artifact distributions are used in corrections, you can supply
##D # un-named list of distributions in which the order of distributions corresponds to the order of
##D # meta-analyses in ma_obj. It is important for the elements to be un-named, as the absence of names 
##D # and the length of the list are the two ways in which ma_r_ad() validates the lists.
##D ad_list_pairmod_x <- ad_tibble_pairmod$ad_x
##D ad_list_pairmod_y <- ad_tibble_pairmod$ad_y
##D # Passing these lists of distributions to ma_r_ad() corrects 'ma_obj' for artifacts:
##D ma_obj_pairmodlist <- ma_r_ad(ma_obj = ma_obj,
##D                               ad_obj_x = ad_list_pairmod_x, ad_obj_y = ad_list_pairmod_y)
##D summary(ma_obj_pairmodlist)
##D ma_obj_pairmodlist$meta_tables[[1]]$artifact_distribution$true_score
## End(Not run)



