library(Momocs)


### Name: get_slidings
### Title: Extracts sliding landmarks coordinates
### Aliases: get_slidings

### ** Examples

# for each example below a list with partition containign shapes is returned
# extracts the first partition
get_slidings(chaff, 1) %>% names()
# the first and the fourth
get_slidings(chaff, c(1, 4)) %>%  names()
# all of them
get_slidings(chaff) %>%  names
# here we want to see it
get_slidings(chaff, 1)[[1]] %>%  Ldk %>% stack



