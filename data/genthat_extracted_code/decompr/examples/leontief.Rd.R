library(decompr)


### Name: leontief
### Title: Leontief Decomposition
### Aliases: leontief

### ** Examples

## load example data
data(leather)

## create intermediate object (class decompr)
decompr_object <- load_tables_vectors(inter,
                                      final,
                                      countries,
                                      industries,
                                      out        )

## run the Leontief decomposition on the decompr object
leontief(decompr_object )



