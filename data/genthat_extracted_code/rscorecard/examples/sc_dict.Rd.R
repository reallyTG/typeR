library(rscorecard)


### Name: sc_dict
### Title: Search data dictionary.
### Aliases: sc_dict

### ** Examples

sc_dict('state')
sc_dict('^st', search_col = 'varname') # variable names starting with 'st'
sc_dict('.', limit = Inf) # return full dictionary (not recommended)



