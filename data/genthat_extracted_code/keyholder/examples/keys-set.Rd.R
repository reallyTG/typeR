library(keyholder)


### Name: keys-set
### Title: Set keys
### Aliases: keys-set keys<- assign_keys key_by unkey

### ** Examples

df <- dplyr::as_tibble(mtcars)

# Value is converted to tibble
keys(df) <- 1:nrow(df)

# This will throw an error
## Not run: 
##D keys(df) <- 1:10
## End(Not run)

# Use 'vs' and 'am' as keys
df %>% key_by(vs, am)

df %>% key_by(vs, am, .exclude = TRUE)

df %>% key_by(vs) %>% key_by(am, .add = TRUE, .exclude = TRUE)

# Override keys
df %>% key_by(vs, am) %>% dplyr::mutate(vs = 1) %>%
  key_by(gear, vs, .add = TRUE)

# Use select helpers
df %>% key_by(dplyr::one_of(c("vs", "am")))

df %>% key_by(dplyr::everything())




