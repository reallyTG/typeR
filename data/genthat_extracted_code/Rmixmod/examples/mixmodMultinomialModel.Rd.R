library(Rmixmod)


### Name: mixmodMultinomialModel
### Title: Create an instance of the ['MultinomialModel'] class
### Aliases: mixmodMultinomialModel

### ** Examples

  mixmodMultinomialModel()
  # multinomial models with equal proportions
  mixmodMultinomialModel(equal.proportions=TRUE,free.proportions=FALSE)
  # multinomial models with a pre-defined list
  mixmodMultinomialModel( listModels=c("Binary_pk_E","Binary_p_E") )
  # multinomial models with equal proportions and independent of the variable
  mixmodMultinomialModel(free.proportions=FALSE, variable.independency=TRUE)




