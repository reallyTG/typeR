library(decompr)


### Name: wwz
### Title: Runs the Wang-Wei-Zhu decomposition
### Aliases: wwz

### ** Examples

# load example data
data(leather)

# create intermediate object (class decompr)
decompr_object <- load_tables_vectors(inter,
                                      final,
                                      countries,
                                      industries,
                                      out        )

# run the WWZ decomposition on the decompr object
wwz(decompr_object)



