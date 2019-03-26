library(keyholder)


### Name: keyed-df-one-tbl
### Title: One-table verbs from dplyr for keyed_df
### Aliases: keyed-df-one-tbl select.keyed_df rename.keyed_df
###   mutate.keyed_df summarise.keyed_df group_by.keyed_df ungroup.keyed_df
###   rowwise.keyed_df distinct.keyed_df do.keyed_df arrange.keyed_df
###   filter.keyed_df slice.keyed_df

### ** Examples

mtcars %>% key_by(vs, am) %>% dplyr::mutate(gear = 1)




