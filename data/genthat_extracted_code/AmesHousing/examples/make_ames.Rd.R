library(AmesHousing)


### Name: make_ames
### Title: Create a Processed Version of the Ames Housing Data
### Aliases: make_ames make_ordinal_ames

### ** Examples

ames <- make_ames()
nrow(ames)
summary(ames$Sale_Price)

ames_ord <- make_ordinal_ames()
ord_vars <- vapply(ames_ord, is.ordered, logical(1))
names(ord_vars)[ord_vars]



