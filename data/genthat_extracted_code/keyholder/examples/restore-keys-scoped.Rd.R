library(keyholder)


### Name: restore-keys-scoped
### Title: Restore selection of keys
### Aliases: restore-keys-scoped restore_keys_all restore_keys_if
###   restore_keys_at

### ** Examples

df <- mtcars %>% dplyr::as_tibble() %>% key_by(vs, am, disp)
# Just restore all keys
df %>% restore_keys_all()

# Restore all keys with renaming and without touching actual keys
df %>% restore_keys_all(.funs = toupper)

# Restore with renaming and removing
df %>%
  restore_keys_all(.funs = toupper, .remove = TRUE)

# Restore with renaming, removing and unkeying
df %>%
  restore_keys_all(.funs = toupper, .remove = TRUE, .unkey = TRUE)

# Restore with renaming keys satisfying the predicate
df %>%
  restore_keys_if(rlang::is_integerish, .funs = toupper)

# Restore with renaming specified keys
df %>%
  restore_keys_at(c("vs", "disp"), .funs = toupper)




