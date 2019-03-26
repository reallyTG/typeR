library(gvc)


### Name: e2r
### Title: Exporting to Re-export
### Aliases: e2r

### ** Examples

# load the decompr package
library(decompr)

# load the example data set
data(leather)

# create a leontief decomposed data set
l <- decomp(inter,
            final,
            countries,
            industries,
            out)
 
 # apply the Exporting to Re-export
 e2r( l )



