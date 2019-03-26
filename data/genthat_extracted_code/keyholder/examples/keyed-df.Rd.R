library(keyholder)


### Name: keyed-df
### Title: Keyed object
### Aliases: keyed-df is_keyed_df is.keyed_df print.keyed_df [.keyed_df

### ** Examples

is_keyed_df(mtcars)

mtcars %>% key_by(vs) %>% is_keyed_df

# Not valid keyed_df
df <- mtcars
class(df) <- c("keyed_df", "data.frame")
is_keyed_df(df)




