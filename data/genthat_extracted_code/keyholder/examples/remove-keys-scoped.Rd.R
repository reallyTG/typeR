library(keyholder)


### Name: remove-keys-scoped
### Title: Remove selection of keys
### Aliases: remove-keys-scoped remove_keys_all remove_keys_if
###   remove_keys_at

### ** Examples

df <- mtcars %>% dplyr::as_tibble() %>% key_by(vs, am, disp)
df %>% remove_keys_all()

df %>% remove_keys_all(.unkey = TRUE)

df %>% remove_keys_if(rlang::is_integerish)

df %>% remove_keys_at(c("vs", "am"))




