library(auk)


### Name: auk_filter
### Title: Filter the eBird file using AWK
### Aliases: auk_filter auk_filter.auk_ebd auk_filter.auk_sampling

### ** Examples

# get the path to the example data included in the package
# in practice, provide path to ebd, e.g. f <- "data/ebd_relFeb-2018.txt"
f <- system.file("extdata/ebd-sample.txt", package = "auk")
# define filters
filters <- auk_ebd(f) %>%
  auk_species(species = c("Canada Jay", "Blue Jay")) %>%
  auk_country(country = c("US", "Canada")) %>%
  auk_bbox(bbox = c(-100, 37, -80, 52)) %>%
  auk_date(date = c("2012-01-01", "2012-12-31")) %>%
  auk_time(start_time = c("06:00", "09:00")) %>%
  auk_duration(duration = c(0, 60)) %>%
  auk_complete()
  
# alternatively, without pipes
ebd <- auk_ebd(system.file("extdata/ebd-sample.txt", package = "auk"))
filters <- auk_species(ebd, species = c("Canada Jay", "Blue Jay"))
filters <- auk_country(filters, country = c("US", "Canada"))
filters <- auk_bbox(filters, bbox = c(-100, 37, -80, 52))
filters <- auk_date(filters, date = c("2012-01-01", "2012-12-31"))
filters <- auk_time(filters, start_time = c("06:00", "09:00"))
filters <- auk_duration(filters, duration = c(0, 60))
filters <- auk_complete(filters)

# apply filters
## Not run: 
##D # output to a temp file for example
##D # in practice, provide path to output file
##D # e.g. f_out <- "output/ebd_filtered.txt"
##D f_out <- tempfile()
##D filtered <- auk_filter(filters, file = f_out)
##D str(read_ebd(filtered))
## End(Not run)



