library(fuzzyforest)


### Name: WGCNA_control
### Title: Set Parameters for WGCNA Step of Fuzzy Forests
### Aliases: WGCNA_control

### ** Examples

WGCNA_params <- WGCNA_control(p=7, minModuleSize=30, TOMType = "unsigned",
                              reassignThreshold = 0, mergeCutHeight = 0.25,
                              numericLabels = TRUE, pamRespectsDendro = FALSE)



