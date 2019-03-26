library(INDperform)


### Name: test_interaction
### Title: Test for interactions between 2 pressure variables
### Aliases: test_interaction

### ** Examples

## No test: 
# Using some models of the Baltic Sea demo data in this package
init_tbl <- ind_init_ex
mod_tbl <- merge_models_ex[c(5:7),]
interactions <- select_interaction(mod_tbl)
test <- test_interaction(init_tbl, mod_tbl, interactions)

# if only one combination should be tested
interactions <- select_interaction(mod_tbl)[1:2, ]
test <- test_interaction(init_tbl, mod_tbl, interactions)

# Determine manually what to test for (e.g. only TZA ~ Fsprat | Pwin)
interactions <- tibble::tibble(ind = "TZA",
                               press = "Fsprat",
                               t_var = "Pwin" )
test <- test_interaction(init_tbl, mod_tbl, interactions)
## End(No test)



