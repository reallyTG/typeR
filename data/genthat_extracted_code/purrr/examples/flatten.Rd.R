library(purrr)


### Name: flatten
### Title: Flatten a list of lists into a simple vector.
### Aliases: flatten flatten_lgl flatten_int flatten_dbl flatten_chr
###   flatten_raw flatten_dfr flatten_dfc flatten_df

### ** Examples

x <- rerun(2, sample(4))
x
x %>% flatten()
x %>% flatten_int()

# You can use flatten in conjunction with map
x %>% map(1L) %>% flatten_int()
# But it's more efficient to use the typed map instead.
x %>% map_int(1L)



