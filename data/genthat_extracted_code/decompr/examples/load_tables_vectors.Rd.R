library(decompr)


### Name: load_tables_vectors
### Title: Load the Input-Output and Final demand tables
### Aliases: load_tables_vectors

### ** Examples

# load example data
data(leather)

# create intermediate object (class decompr)
decompr_object <- load_tables_vectors(inter,
                                      final,
                                      countries,
                                      industries,
                                      out)

# examine output object                                    
str(decompr_object)



