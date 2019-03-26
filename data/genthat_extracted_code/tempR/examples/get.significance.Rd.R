library(tempR)


### Name: get.significance
### Title: TDS significance proportion
### Aliases: get.significance

### ** Examples

# example using 'bars' data set
attributes <- unique(bars$attribute)
chance <- get.chance(attributes)
signif <- get.significance(chance, nrow(unique(bars[, 1:2])))
signif



