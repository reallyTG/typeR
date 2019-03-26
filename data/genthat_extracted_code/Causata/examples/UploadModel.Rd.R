library(Causata)


### Name: UploadModel
### Title: Loads a model definition into Causata for scoring.
### Aliases: UploadModel UploadModelWithValidation

### ** Examples

# An example query function for UploadModelWithValidation
# The focal point query below returns profiles from the most recent
# ad impression where the product name is "Test Product".
query.function <- function(variables, more.variables=c(), limit=100){
  query <- paste(
    "select", BacktickCollapse(c(variables, more.variables)),
    "from Scenarios S,",
    "     `ad-impression` E",
    "where S.profile_id = E.profile_id",
    "  and S.focal_point = E.timestamp",
    "  and is_last(E.timestamp)",
    "and exists",
    "( select *",
    "  from `ad-impression` A",
    "  where A.`product-name` = 'Test Product'",
    ")",
    "Limit", limit)
  return(query)
}



