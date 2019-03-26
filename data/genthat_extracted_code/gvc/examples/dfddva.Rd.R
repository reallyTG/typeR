library(gvc)


### Name: dfddva
### Title: Domestic Final Demand Domestic Value Added
### Aliases: dfddva

### ** Examples

# load the decompr package
library(decompr)

# load example data
data(leather)

# create a leontief decomposed data set
l <- decomp(inter,
            final,
            countries,
            industries,
            out,
            method = "leontief",
            post = "final_demand")
 
 # apply dfddva
 dfddva( l )



