library(Momocs)


### Name: coo_trimtop
### Title: Trims top coordinates from shape
### Aliases: coo_trimtop

### ** Examples

olea[1] %>% coo_sample(12) %T>%
   print() %T>% ldk_plot() %>%
   coo_trimtop(4) %T>% print() %>% points(col="red")



