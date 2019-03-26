library(elasticsearchr)


### Name: %search%
### Title: Execute query or search.
### Aliases: %search%

### ** Examples

## Not run: 
##D results <- elastic("http://localhost:9200", "iris", "data") %search% query('{"match_all": {}}')
##D head(results)
##D #   sepal_length sepal_width petal_length petal_width species
##D # 1          4.8         3.0          1.4         0.1  setosa
##D # 2          4.3         3.0          1.1         0.1  setosa
##D # 3          5.8         4.0          1.2         0.2  setosa
##D # 4          5.1         3.5          1.4         0.3  setosa
##D # 5          5.2         3.5          1.5         0.2  setosa
##D # 6          5.2         3.4          1.4         0.2  setosa
## End(Not run)



