library(Momocs)


### Name: coo_trimbottom
### Title: Trims bottom coordinates from shape
### Aliases: coo_trimbottom

### ** Examples

olea[1] %>% coo_sample(12) %T>%
   print() %T>% ldk_plot() %>%
   coo_trimbottom(4) %T>% print() %>% points(col="red")



