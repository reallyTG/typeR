library(radjust)


### Name: radjust_sym
### Title: Adjust p-values for Replicability across Two Independent Studies
###   with Multiple Endpoints
### Aliases: radjust_sym

### ** Examples


data(mice)
## transform the two-sided p-values to one-sided in the same direction (left):
## (we use the direction of the test statistic to do so and assume that it is continuous)

pv1 <- ifelse(mice$dir_is_left1, mice$twosided_pv1/2, 1-mice$twosided_pv1/2)
pv2 <- ifelse(mice$dir_is_left2, mice$twosided_pv2/2, 1-mice$twosided_pv2/2)

## run the examples as in the article:

mice_rv_adaptive <- radjust_sym(pv1, pv2, input_type = "all", directional_rep_claim = TRUE,
                                variant = "adaptive", alpha=0.05)
print(mice_rv_adaptive)

mice_rv_non_adpt_sel <- radjust_sym(pv1, pv2, input_type = "all", directional_rep_claim = TRUE,
                                    variant = "non-adaptive-with-alpha-selection", alpha=0.05)
print(mice_rv_non_adpt_sel)

mice_rv_non_adpt <- radjust_sym(pv1, pv2, input_type = "selected", directional_rep_claim = TRUE,
                                variant = "non-adaptive")
print(mice_rv_non_adpt)




