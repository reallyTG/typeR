library(ROI)


### Name: ROI_plugin_make_signature
### Title: Make Signatures
### Aliases: ROI_plugin_make_signature

### ** Examples

## ROI_make_LP_signatures
lp_signature <- ROI_plugin_make_signature( objective = "L",
                                           constraints = "L",
                                           types = c("C"),
                                           bounds = c("X", "V"),
                                           cones = c("X"),
                                           maximum = c(TRUE, FALSE) )



