library(psychmeta)


### Name: get_stuff
### Title: Extract results from a psychmeta meta-analysis object
### Aliases: get_stuff get_escalc get_metafor get_metatab get_ad
###   get_followup get_heterogeneity get_leave1out get_cumulative
###   get_bootstrap get_metareg get_matrix get_plots

### ** Examples

## Not run: 
##D ## Run meta-analysis:
##D ma_obj <- ma_r(ma_method = "ic", rxyi = rxyi, n = n, rxx = rxxi, ryy = ryyi,
##D                construct_x = x_name, construct_y = y_name,
##D                sample_id = sample_id, citekey = NULL,
##D                moderators = moderator, data = data_r_meas_multi,
##D                impute_artifacts = FALSE, clean_artifacts = FALSE)
##D ma_obj <- ma_r_ad(ma_obj, correct_rr_x = FALSE, correct_rr_y = FALSE)
##D 
##D ## Run additional analyses:
##D ma_obj <- heterogeneity(ma_obj)
##D ma_obj <- sensitivity(ma_obj, boot_iter = 10, boot_ci_type = "norm")
##D ma_obj <- metareg(ma_obj)
##D ma_obj <- plot_funnel(ma_obj)
##D ma_obj <- plot_forest(ma_obj)
##D 
##D ## View summary:
##D summary(ma_obj)
##D 
##D ## Extract selected analyses:
##D get_metatab(ma_obj)
##D get_matrix(ma_obj)
##D get_escalc(ma_obj)
##D get_bootstrap(ma_obj)
##D get_cumulative(ma_obj)
##D get_leave1out(ma_obj)
##D get_heterogeneity(ma_obj)
##D get_metareg(ma_obj)
##D get_plots(ma_obj)
##D get_ad(ma_obj, ma_method = "ic", as_ad_obj = TRUE)
##D get_ad(ma_obj, ma_method = "ic", as_ad_obj = FALSE)
##D 
##D ## Same extractions as above, but using get_stuff() and the "what" argument:
##D get_stuff(ma_obj, what = "metatab")
##D get_stuff(ma_obj, what = "matrix")
##D get_stuff(ma_obj, what = "escalc")
##D get_stuff(ma_obj, what = "bootstrap")
##D get_stuff(ma_obj, what = "cumulative")
##D get_stuff(ma_obj, what = "leave1out")
##D get_stuff(ma_obj, what = "heterogeneity")
##D get_stuff(ma_obj, what = "metareg")
##D get_stuff(ma_obj, what = "plots")
##D get_stuff(ma_obj, what = "ad", ma_method = "ic", as_ad_obj = TRUE)
##D get_stuff(ma_obj, what = "ad", ma_method = "ic", as_ad_obj = FALSE)
## End(Not run)



