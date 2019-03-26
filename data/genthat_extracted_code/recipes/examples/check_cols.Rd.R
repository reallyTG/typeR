library(recipes)


### Name: check_cols
### Title: Check if all Columns are Present
### Aliases: check_cols tidy.check_cols

### ** Examples


data(biomass)

biomass_rec <- recipe(HHV ~ ., data = biomass) %>%
   step_rm(sample, dataset) %>%
   check_cols(contains("gen")) %>%
   step_center(all_predictors())

## Not run: 
##D bake(biomass_rec, biomass[, c("carbon", "HHV")])
## End(Not run)



