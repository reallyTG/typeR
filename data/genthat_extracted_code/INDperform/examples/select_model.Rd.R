library(INDperform)


### Name: select_model
### Title: Select the best correlation structure in the GAMM
### Aliases: select_model

### ** Examples

# Using some models of the Baltic Sea demo data
test_ids <- c(67:70)
gam_tbl <- model_gam_ex[model_gam_ex$id %in% test_ids,]
gamm_tbl <- model_gamm(ind_init_ex[test_ids,], filter = gam_tbl$tac)
best_gamm <- select_model(gam_tbl, gamm_tbl)



