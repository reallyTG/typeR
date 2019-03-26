library(keyholder)


### Name: keys-manipulate
### Title: Manipulate keys
### Aliases: keys-manipulate remove_keys restore_keys pull_key rename_keys

### ** Examples

df <- mtcars %>% dplyr::as_tibble() %>%
  key_by(vs, am, .exclude = TRUE)
df %>% remove_keys(vs)

df %>% remove_keys(dplyr::everything())

df %>% remove_keys(dplyr::everything(), .unkey = TRUE)


df %>% restore_keys(vs)

df %>% restore_keys(vs, .remove = TRUE)


df %>% restore_keys(dplyr::everything(), .remove = TRUE)

df %>% restore_keys(dplyr::everything(), .remove = TRUE, .unkey = TRUE)


# Restoring on grouped data frame
df_grouped <- df %>% dplyr::mutate(vs = 1) %>% dplyr::group_by(vs)
df_grouped %>% restore_keys(dplyr::everything())

# Pulling
df %>% pull_key(vs)

# Renaming
df %>% rename_keys(Vs = vs)




