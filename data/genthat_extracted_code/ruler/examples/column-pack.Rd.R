library(ruler)


### Name: column-pack
### Title: Column rule pack
### Aliases: column-pack

### ** Examples

# Validating present columns
numeric_column_rules <- . %>% dplyr::summarise_if(
  is.numeric,
  rules(mean(.) > 5, sd(.) < 10)
)
character_column_rules <- . %>% dplyr::summarise_if(
  is.character,
  rules(. %in% letters[1:4])
)

col_packs(
  num_col = numeric_column_rules,
  chr_col = character_column_rules
)

# Dealing with one column edge case
improper_pack <- . %>% dplyr::summarise_at(
  dplyr::vars(vs),
  rules(improper_is_chr = is.character)
)

proper_pack <- . %>% dplyr::summarise_at(
  dplyr::vars(vs = vs),
  rules(proper_is_chr = is.character)
)

mtcars %>%
  expose(col_packs(improper_pack, proper_pack)) %>%
  get_report()




