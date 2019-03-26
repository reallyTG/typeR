library(AutoModel)


### Name: create_model_objects
### Title: Hierarchical Regression Model Generation
### Aliases: create_model_objects

### ** Examples

create_model_objects(create_formula_objects("y", c("lag.quarterly.revenue")
, c("price.index")), dataset = freeny)
freeny_model_formulas <- create_formula_objects("y", c("lag.quarterly.revenue")
, c("price.index"))
create_model_objects(freeny_model_formulas, dataset = freeny)



