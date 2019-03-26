library(gvc)


### Name: dfdfva
### Title: Domestic Final Demand Foreign Value Added
### Aliases: dfdfva

### ** Examples

# load the decompr package
library(decompr)

# load the example data
data(leather)

# create a leontief decomposed data set
l <- decomp(inter,
            final,
            countries,
            industries,
            out,
            method = "leontief",
            post = "final_demand")

 # apply dfdfva
 dfdfva( l )



