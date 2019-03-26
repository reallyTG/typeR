library(Rmixmod)


### Name: mixmodGaussianModel
### Title: Create an instance of the ['GaussianModel'] class
### Aliases: mixmodGaussianModel

### ** Examples

  mixmodGaussianModel()
  # all Gaussian models with equal proportions
  mixmodGaussianModel(family="all",free.proportions=FALSE)
  # Diagonal and Spherical Gaussian models
  mixmodGaussianModel(family=c("diagonal","spherical"))
  # Gaussian models with a pre-defined list
  mixmodGaussianModel(listModels=c("Gaussian_p_L_C","Gaussian_p_L_Ck","Gaussian_pk_L_I"))




