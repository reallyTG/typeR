library(Momocs)


### Name: coo_range
### Title: Calculate coordinates range
### Aliases: coo_range coo_range.default coo_range.Coo coo_range_enlarge
###   coo_range_enlarge.default coo_range_enlarge.Coo
###   coo_range_enlarge.list coo_diffrange coo_diffrange.default
###   coo_diffrange.Coo coo_diffrange.list

### ** Examples

bot[1] %>% coo_range # single shape
bot    %>% coo_range # Coo object

bot[1] %>% coo_range_enlarge(1/50) # single shape
bot    %>% coo_range_enlarge(1/50) # Coo object



