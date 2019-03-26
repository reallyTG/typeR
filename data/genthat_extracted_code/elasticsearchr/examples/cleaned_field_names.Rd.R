library(elasticsearchr)


### Name: cleaned_field_names
### Title: Sanitise column names.
### Aliases: cleaned_field_names

### ** Examples

## Not run: 
##D df <- iris
##D colnames(df) <- cleaned_field_names(colnames(df))
##D colnames(df)
##D # "sepal_length" "sepal_width"  "petal_length" "petal_width"  "species"
## End(Not run)



