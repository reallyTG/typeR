library(ecd)


### Name: ecld.quartic_Qp_atm_attr
### Title: Calculate ATM attributes from key quartic parameters
### Aliases: ecld.quartic_Qp_atm_attr ecld.quartic_model_sample
###   ecld.quartic_model_sample_attr
### Keywords: quartic

### ** Examples

ttm <- seq(sqrt(90), sqrt(365), length.out=3)^2 / 365
epsr = 0.014 + 0*ttm
mupr <- -(ecld.quartic_SN0_max_RNV() - 0.2*sqrt(ttm))
## Not run: 
##D     df <- data.frame(ttm=ttm, sigma=0.2*sqrt(ttm/120), mu_plus_ratio=mupr, epsilon_ratio=epsr)
##D     ecld.quartic_Qp_atm_attr(df)
## End(Not run)



