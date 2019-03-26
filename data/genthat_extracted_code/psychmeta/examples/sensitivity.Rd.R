library(psychmeta)


### Name: sensitivity
### Title: Sensitivity analyses for meta-analyses
### Aliases: sensitivity sensitivity_bootstrap sensitivity_cumulative
###   sensitivity_leave1out

### ** Examples

## Not run: 
##D ## Run a meta-analysis using simulated correlation data:
##D ma_obj <- ma_r_ic(rxyi = rxyi, n = n, rxx = rxxi, ryy = ryyi, ux = ux,
##D                   correct_rr_y = FALSE, data = data_r_uvirr)
##D ma_obj <- ma_r_ad(ma_obj, correct_rr_y = FALSE)
##D 
##D ## Pass the meta-analysis object to the sensitivity() function:
##D ma_obj <- sensitivity(ma_obj = ma_obj, boot_iter = 10,
##D                       boot_ci_type = "norm", sort_method = "inv_var")
##D 
##D ## Examine the tables and plots produced for the IC meta-analysis:
##D ma_obj$bootstrap[[1]]$barebones
##D ma_obj$bootstrap[[1]]$individual_correction$true_score
##D ma_obj$leave1out[[1]]$individual_correction$true_score
##D ma_obj$cumulative[[1]]$individual_correction$true_score
##D 
##D ## Examine the tables and plots produced for the AD meta-analysis:
##D ma_obj$bootstrap[[1]]$artifact_distribution$true_score
##D ma_obj$leave1out[[1]]$artifact_distribution$true_score
##D ma_obj$cumulative[[1]]$artifact_distribution$true_score
##D 
##D 
##D ## Run a meta-analysis using simulated d-value data:
##D ma_obj <- ma_d_ic(d = d, n1 = n1, n2 = n2, ryy = ryyi,
##D                   data = filter(data_d_meas_multi, construct == "Y"))
##D ma_obj <- ma_d_ad(ma_obj)
##D                   
##D ## Pass the meta-analysis object to the sensitivity() function:
##D ma_obj <- sensitivity(ma_obj = ma_obj, boot_iter = 10,
##D                       boot_ci_type = "norm", sort_method = "inv_var")
##D 
##D ## Examine the tables and plots produced for the IC meta-analysis:
##D ma_obj$bootstrap[[1]]$barebones
##D ma_obj$bootstrap[[1]]$individual_correction$latentGroup_latentY
##D ma_obj$leave1out[[1]]$individual_correction$latentGroup_latentY
##D ma_obj$cumulative[[1]]$individual_correction$latentGroup_latentY
##D 
##D ## Examine the tables and plots produced for the AD meta-analysis:
##D ma_obj$bootstrap[[1]]$artifact_distribution$latentGroup_latentY
##D ma_obj$leave1out[[1]]$artifact_distribution$latentGroup_latentY
##D ma_obj$cumulative[[1]]$artifact_distribution$latentGroup_latentY
## End(Not run)



