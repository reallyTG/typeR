library(ruler)


### Name: expose
### Title: Expose data to rule packs
### Aliases: expose

### ** Examples

my_rule_pack <- . %>% dplyr::summarise(nrow_neg = nrow(.) < 0)
my_data_packs <- data_packs(my_data_pack_1 = my_rule_pack)

# These pipes give identical results
mtcars %>% expose(my_data_packs) %>% get_report()

mtcars %>% expose(my_data_pack_1 = my_rule_pack) %>% get_report()

# This throws an error because no pack type is specified for my_rule_pack
## Not run: 
##D   mtcars %>% expose(my_data_pack_1 = my_rule_pack, .guess = FALSE)
## End(Not run)

# Edge cases against using 'guess = TRUE' for robust code
group_rule_pack <- . %>% dplyr::mutate(vs_one = vs == 1) %>%
  dplyr::group_by(vs_one, am) %>%
  dplyr::summarise(n_low = dplyr::n() > 10)
group_rule_pack_dummy <- . %>% dplyr::mutate(vs_one = vs == 1) %>%
  dplyr::group_by(mpg, vs_one, wt) %>%
  dplyr::summarise(n_low = dplyr::n() > 10)
row_rule_pack <- . %>% dplyr::transmute(neg_row_sum = rowSums(.) < 0)
cell_rule_pack <- . %>% dplyr::transmute_all(rules(neg_value = . < 0))

# Only column 'am' is guessed as grouping which defines non-unique levels.
## Not run: 
##D   mtcars %>%
##D     expose(group_rule_pack, .remove_obeyers = FALSE, .guess = TRUE) %>%
##D     get_report()
## End(Not run)

# Values in `var` should contain combination of three grouping columns but
# column 'vs_one' is guessed as rule. No error is thrown because the guessed
# grouping column define unique levels.
mtcars %>%
  expose(group_rule_pack_dummy, .remove_obeyers = FALSE, .guess = TRUE) %>%
  get_report()

# Results should have in column 'id' value 1 and not 0.
mtcars %>% dplyr::slice(1) %>% expose(row_rule_pack) %>% get_report()

mtcars %>% dplyr::slice(1) %>% expose(cell_rule_pack) %>% get_report()




