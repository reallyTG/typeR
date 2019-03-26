library(gvc)


### Name: upstream
### Title: Upstreamness
### Aliases: upstream

### ** Examples

# load the decompr package
library(decompr)

# load example data
data(leather)

# create a leontief decomposed data set
l <- load_tables_vectors(inter,
                         final,
                         countries,
                         industries,
                         out        )
 
 # apply upstream
 upstream( l )



