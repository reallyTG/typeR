library(keyholder)


### Name: keyed-df-two-tbl
### Title: Two-table verbs from dplyr for keyed_df
### Aliases: keyed-df-two-tbl inner_join.keyed_df left_join.keyed_df
###   right_join.keyed_df full_join.keyed_df semi_join.keyed_df
###   anti_join.keyed_df

### ** Examples


dplyr::band_members %>% key_by(band) %>%
  dplyr::semi_join(dplyr::band_instruments, by = "name") %>%
  keys()




