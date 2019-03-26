library(rubias)


### Name: tcf2long
### Title: Convert Two-Column Genetic Data to Long Format
### Aliases: tcf2long
### Keywords: internal

### ** Examples

## Convert the alewife dataset for further processing
# the data frame passed into this function must have had
# character collections and repunits converted to factors
reference <- alewife
reference$repunit <- factor(reference$repunit, levels = unique(reference$repunit))
reference$collection <- factor(reference$collection, levels = unique(reference$collection))
ale_long <- tcf2long(reference, 17)



