library(fredr)


### Name: fredr_release_series
### Title: Get the series on a release of economic data
### Aliases: fredr_release_series

### ** Examples

## No test: 
fredr_release_series(release_id = 20L)

fredr_release_series(release_id = 20L, order_by = "popularity")

# Extract the "catalog" of series from a release on a certain date
fredr_release_series(
   release_id = 20L,
   realtime_end = as.Date("2018-07-13"),
   order_by = "popularity"
)
## End(No test)



