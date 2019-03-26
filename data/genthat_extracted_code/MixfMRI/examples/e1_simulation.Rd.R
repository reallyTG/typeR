library(MixfMRI)


### Name: Simulations
### Title: Generate datasets for MixfMRI simulations
### Aliases: gendataset
### Keywords: programming

### ** Examples

## No test: 
  library(MixfMRI, quietly = TRUE)
  set.seed(1234)
  da <- gendataset(phantom = shepp1fMRI, overlap = 0.01)$pval
  da2 <- gendataset(phantom = shepp2fMRI, overlap = 0.01)$pval

  par(mfrow = c(2, 2), mar = rep(0.05, 4))
  image(shepp1fMRI[50:210, 50:210], axes = FALSE)
  image(shepp2fMRI[50:210, 50:210], axes = FALSE)
  image(da[50:210, 50:210], axes = FALSE)
  image(da2[50:210, 50:210], axes = FALSE)
## End(No test)



