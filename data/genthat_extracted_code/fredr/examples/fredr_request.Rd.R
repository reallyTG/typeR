library(fredr)


### Name: fredr_request
### Title: Send a request to the FRED API
### Aliases: fredr_request

### ** Examples

## No test: 

fredr_request(
  endpoint = "series/observations",
  series_id = "GNPCA",
  observation_start = "1990-01-01",
  observation_end = "2000-01-01"
)
# Compare with to_frame = TRUE
resp <- fredr_request(
  endpoint = "series/observations",
  series_id = "GNPCA",
  observation_start = "1990-01-01",
  observation_end = "2000-01-01",
  to_frame = FALSE
)

## End(No test)



