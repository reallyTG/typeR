library(sctransform)


### Name: denoise
### Title: Denoise data by setting all latent factors to their median
###   values and reversing the regression model
### Aliases: denoise

### ** Examples

vst_out <- vst(pbmc, return_cell_attr = TRUE)
umi_denoised <- denoise(vst_out)




