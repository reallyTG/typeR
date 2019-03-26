library(gvc)


### Name: i2e
### Title: Importing to Export
### Aliases: i2e vertical_specialisation vertical_specialization

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
 
 # apply the Import to Exports analysis
 i2e( l )



