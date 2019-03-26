library(icd)


### Name: categorize_simple
### Title: Categorize codes according to a mapping
### Aliases: categorize_simple

### ** Examples

## Not run: 
##D u <- uranium_pathology
##D m <- icd10_map_ahrq
##D u$icd10 <- decimal_to_short(u$icd10)
##D j <- categorize_simple(u, m, id_name = "case", code_name = "icd10")
## End(Not run)



