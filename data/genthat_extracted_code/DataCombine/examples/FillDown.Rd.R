library(DataCombine)


### Name: FillDown
### Title: Fills in missing (NA) values with the previous non-missing value
### Aliases: FillDown

### ** Examples

# Create fake data
id <- c('Algeria', NA, NA, NA, 'Mexico', NA, NA)
score <- rnorm(7)
Data <- data.frame(id, score)

# FillDown id
DataOut <- FillDown(Data, 'id')

## Not run: 
##D # Use group_by and mutate from dplyr to FillDown grouped data, e.g.:
##D Example <- Example %>% group_by(grouping) %>% 
##D              mutate(NewFilled = FillDown(Var = VarToFill))
## End(Not run)



