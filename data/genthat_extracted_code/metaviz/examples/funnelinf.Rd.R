library(metaviz)


### Name: funnelinf
### Title: Visual funnel plot inference for meta-analysis
### Aliases: funnelinf

### ** Examples

## Not run: 
##D # Plotting a funnel plot lineup with the exrehab data to conduct visual funnel plot inference
##D funnelinf(x = exrehab[, c("logrr", "logrr_se")])
##D 
##D # Plotting a funnel plot lineup with the mozart data to conduct visual funnel plot inference
##D # considering subgroups
##D funnelinf(x = mozart[, c("d", "se")],
##D group = mozart[, "rr_lab"],
##D group_permut = TRUE, null_model = "REM")
##D 
##D # Plotting a funnel plot lineup with the brainvolume data to conduct visual funnel plot inference
##D # considering heterogeneity by using the fixed effect model for null plot simulation
##D funnelinf(x = brainvol[, c("z", "z_se")],
##D null_model = "FEM")
## End(Not run)



