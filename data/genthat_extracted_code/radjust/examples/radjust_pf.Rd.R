library(radjust)


### Name: radjust_pf
### Title: Adjust p-values for Replicability across Two Independent,
###   Primary and Follow-up, Studies with Multiple Endpoints
### Aliases: radjust_pf

### ** Examples

 data(crohn)
 rv  <- radjust_pf(pv1 = crohn$pv1, pv2 = crohn$pv1, m = 635547, l00 = 0.8)
 rv2 <- radjust_pf(pv1 = crohn$pv1, pv2 = crohn$pv1, m = 635547, l00 = 0.8,
                   variant="use_threshold",threshold = 1e-5)




