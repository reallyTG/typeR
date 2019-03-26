library(Momocs)


### Name: coo_trim
### Title: Trims both ends coordinates from shape
### Aliases: coo_trim

### ** Examples

olea[1] %>% coo_sample(12) %T>%
   print() %T>% ldk_plot() %>%
   coo_trim(1) %T>% print() %>% points(col="red")



