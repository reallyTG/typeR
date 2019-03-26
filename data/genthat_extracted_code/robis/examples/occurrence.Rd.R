library(robis)


### Name: occurrence
### Title: Find occurrences.
### Aliases: occurrence

### ** Examples

records <- occurrence(scientificname = "Abra sibogai")
records <- occurrence(aphiaid = 141438, startdate = as.Date("2007-10-10"))
records <- occurrence(aphiaid = 141438, geometry = "POLYGON ((0 0, 0 45, 45 45, 45 0, 0 0))")
records <- occurrence(scientificname = "Abra sibogai", qc = c(1:6, 27))
records <- occurrence(scientificname = "Abra sibogai",
                      fields = c("species", "decimalLongitude", "decimalLatitude"))



