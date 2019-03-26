library(febr)


### Name: febr2spdf
### Title: Create an object of class 'SpatialPointsDataFrame'
### Aliases: febr2spdf

### ** Examples

library(magrittr)
observation(dataset = "ctb0003", variable = "taxon",
            progress = FALSE, verbose = FALSE) %>% 
  febr2spdf() %>%
  sp::spplot(zcol = "taxon_sibcs_2009", auto.key = list(columns = 3), scales = list(draw = TRUE))



