## ---- echo=FALSE, include=FALSE------------------------------------------
library(rgho)

## ------------------------------------------------------------------------
get_gho_dimensions()

## ------------------------------------------------------------------------
get_gho_codes(dimension = "COUNTRY")
get_gho_codes(dimension = "GHO")

## ------------------------------------------------------------------------
search_dimensions("region")
search_codes("neonatal", dimension = "GHO")

## ------------------------------------------------------------------------
result <- get_gho_codes(dimension = "REGION")
search_gho(result, "asia")

## ------------------------------------------------------------------------
results <- get_gho_codes(dimension = "COUNTRY")

filter_gho(
  results,
  WHO_REGION_CODE == "EUR"
)

## ------------------------------------------------------------------------
display_attributes(
  results
)
display_attribute_values(
  results,
  "WHO_REGION_CODE"
)

## ------------------------------------------------------------------------
result <- get_gho_data(
  dimension = "GHO",
  code = "MDG_0000000001"
)

print(result, width = Inf)

## ------------------------------------------------------------------------
result <- get_gho_data(
  dimension = "GHO",
  code = "MDG_0000000001",
  filter = list(
    REGION = "EUR",
    YEAR = "2015"
  )
)

print(result, width = Inf)

