library(ruler)


### Name: cell-pack
### Title: Cell rule pack
### Aliases: cell-pack

### ** Examples

cell_outlier_rules <- . %>% dplyr::transmute_at(
  c("disp", "qsec"),
  rules(z_score = abs(. - mean(.)) / sd(.) > 1)
)

cell_packs(outlier = cell_outlier_rules)

# Dealing with one column edge case
improper_pack <- . %>% dplyr::transmute_at(
  dplyr::vars(vs),
  rules(improper_is_neg = . < 0)
)

proper_pack <- . %>% dplyr::transmute_at(
  dplyr::vars(vs = vs),
  rules(proper_is_neg = . < 0)
)

mtcars[1:2, ] %>%
  expose(cell_packs(improper_pack, proper_pack)) %>%
  get_report()




