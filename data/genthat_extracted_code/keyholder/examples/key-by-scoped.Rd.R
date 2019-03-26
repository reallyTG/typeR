library(keyholder)


### Name: key-by-scoped
### Title: Key by selection of variables
### Aliases: key-by-scoped key_by_all key_by_if key_by_at

### ** Examples

mtcars %>% key_by_all(.funs = toupper)

mtcars %>% key_by_if(rlang::is_integerish, toupper)

mtcars %>% key_by_at(c("vs", "am"), toupper)




