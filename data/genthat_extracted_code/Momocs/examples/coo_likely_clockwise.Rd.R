library(Momocs)


### Name: coo_likely_clockwise
### Title: Tests if shapes are (likely) developping clockwise or
###   anticlockwise
### Aliases: coo_likely_clockwise coo_likely_clockwise.default
###   coo_likely_clockwise.Coo coo_likely_anticlockwise

### ** Examples

shapes[4] %>% coo_sample(64) %>% coo_plot()  #clockwise cat
shapes[4] %>% coo_likely_clockwise()
shapes[4] %>% coo_rev() %>% coo_likely_clockwise()

# on Coo
shapes %>% coo_likely_clockwise %>% `[`(4)



