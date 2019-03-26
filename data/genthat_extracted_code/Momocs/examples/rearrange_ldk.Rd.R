library(Momocs)


### Name: rearrange_ldk
### Title: Rearrange, (select and reorder) landmarks to retain
### Aliases: rearrange_ldk

### ** Examples

# Out example
hearts %>% slice(1) %T>% stack %$% ldk
hearts %>% rearrange_ldk(c(4, 1)) %>%
       slice(1) %T>%stack %$% ldk

# Ldk example
wings %>% slice(1) %T>% stack %$% coo
wings %>% rearrange_ldk(c(1, 3, 12:15)) %>%
      slice(1) %T>% stack %$% coo



