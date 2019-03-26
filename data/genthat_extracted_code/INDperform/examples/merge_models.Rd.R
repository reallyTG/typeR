library(INDperform)


### Name: merge_models
### Title: Merging two model output tibbles.
### Aliases: merge_models

### ** Examples

# Using some models of the Baltic Sea demo data:
# Merging GAM and GAMM tibbles
test_ids <- 47:50 # choose subset
gam_tbl <- model_gam_ex[test_ids,]
gamm_tbl <- model_gamm(ind_init_ex[test_ids,], filter= gam_tbl$tac)
best_gamm <- select_model(gam_tbl, gamm_tbl)
merge_models(gam_tbl[gam_tbl$tac == FALSE,], best_gamm)

# Merge 2 IND-specific GAM tibbles (where)
dat_init <- ind_init(
  ind_tbl = ind_ex[, c("TZA", "Cod")],
  press_tbl = press_ex[, c("Tsum", "Swin")],
  time = ind_ex[,1])
gam_tbl1 <- model_gam(dat_init[1:2, ])
# treat a subset differently, e.g. when setting k
gam_tbl2 <- model_gam(dat_init[3:4, ], k = 3)
merge_models(gam_tbl1, gam_tbl2)



