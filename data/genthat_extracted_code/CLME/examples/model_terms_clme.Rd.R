library(CLME)


### Name: model_terms_clme
### Title: Create model matrices for 'clme'
### Aliases: model_terms_clme

### ** Examples

data( rat.blood )
model_terms_clme( mcv ~ time + temp + sex + (1|id) , data = rat.blood )




