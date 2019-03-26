library(psychmeta)


### Name: summarize_ads
### Title: Summarize artifact information from meta-analyses into table
###   format
### Aliases: summarize_ads
### Keywords: internal

### ** Examples

## Not run: 
##D ## Artifact distributions from "ma_r" with individual corrections
##D ma_obj_ic_pairwise <- ma_r(ma_method = "ic", rxyi = "rxyi", n = "n",
##D                            rxx = "rxxi", ryy = "ryyi",
##D                            pairwise_ads = TRUE,
##D                            correct_rr_x = FALSE, correct_rr_y = FALSE,
##D                            construct_x = "x_name", construct_y = "y_name",
##D                            sample_id = "sample_id", moderators = "moderator",
##D                            data = data_r_meas_multi)
##D summarize_ads(ma_obj = ma_obj_ic_pairwise)
##D 
##D ## Artifact distributions from "ma_r" with artifact-distribution corrections (pairwise ADs)
##D ma_obj_ad_pairwise <- ma_r(ma_method = "ad", rxyi = "rxyi", n = "n",
##D                            rxx = "rxxi", ryy = "ryyi",
##D                            pairwise_ads = TRUE,
##D                            correct_rr_x = FALSE, correct_rr_y = FALSE,
##D                            construct_x = "x_name", construct_y = "y_name",
##D                            sample_id = "sample_id", moderators = "moderator",
##D                            data = data_r_meas_multi)
##D summarize_ads(ma_obj = ma_obj_ad_pairwise)
##D 
##D ## Artifact distributions from "ma_r" with artifact-distribution corrections (overall ADs)
##D ma_obj_ad_nonpairwise <- ma_r(ma_method = "ad", rxyi = "rxyi", n = "n",
##D                               rxx = "rxxi", ryy = "ryyi",
##D                               pairwise_ads = FALSE,
##D                               correct_rr_x = FALSE, correct_rr_y = FALSE,
##D                               construct_x = "x_name", construct_y = "y_name",
##D                               sample_id = "sample_id", moderators = "moderator",
##D                               data = data_r_meas_multi)
##D summarize_ads(ma_obj = ma_obj_ad_nonpairwise)
## End(Not run)



