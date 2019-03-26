library(ggseqlogo)


### Name: make_col_scheme
### Title: Create new sequence logo color scheme
### Aliases: make_col_scheme

### ** Examples


# Discrete color scheme examples
cs1 = make_col_scheme(chars=c('A', 'T', 'G', 'C'), groups=c('g1', 'g1', 'g2', 'g2'), 
                      cols=c('red', 'red', 'blue', 'blue'), name='custom1')

cs2 = make_col_scheme(chars=c('A', 'T', 'G', 'C'), cols=c('red', 'red', 'blue', 'blue'), 
                      name='custom2')

# Quantitative color scheme
cs3 = make_col_scheme(chars=c('A', 'T', 'G', 'C'), values=1:4, name='custom3')



