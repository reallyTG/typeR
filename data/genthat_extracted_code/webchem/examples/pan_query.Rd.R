library(webchem)


### Name: pan_query
### Title: Query the PAN Pesticide database
### Aliases: pan_query

### ** Examples

## Not run: 
##D  # might fail if API is not available
##D 
##D  # return all hits
##D  pan_query('2,4-dichlorophenol')[[1]][c(1, 2, 5, 74)]
##D  # return only first hit
##D  pan_query('2,4-dichlorophenol', match = 'first')[[1]][c(1, 2, 5, 74)]
##D  # return only best hit
##D  pan_query('2,4-dichlorophenol', match = 'best')[[1]][c(1, 2, 5, 74)]
##D 
##D  out <- pan_query(c('Triclosan', 'Aspirin'), 'best')
##D  out
##D 
##D  # extract Hydrolysis Half-life (Avg, Days)
##D  sapply(out, function(y) y$`Hydrolysis Half-life (Avg, Days)`)
## End(Not run)



