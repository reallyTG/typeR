library(Rmixmod)


### Name: mixmodCompositeModel
### Title: Create an instance of the ['CompositeModel'] class
### Aliases: mixmodCompositeModel

### ** Examples

  mixmodCompositeModel()
  # composite models with equal proportions
  mixmodCompositeModel(free.proportions=FALSE)
  # composite models with equal proportions and independent of the variable
  mixmodCompositeModel(free.proportions=FALSE, variable.independency=TRUE)
  # composite models with a pre-defined list
  mixmodCompositeModel( listModels=c("Heterogeneous_pk_Ekjh_L_Bk","Heterogeneous_pk_Ekjh_Lk_B") )




