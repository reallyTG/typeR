library(xSub)


### Name: info_xSub
### Title: Information on available xSub files
### Aliases: info_xSub

### ** Examples

# General info on data sources and countries
info_xSub()

# Available files for Pakistan
info_xSub(country_name = "Pakistan")

# Detailed info for Pakistan
info_xSub(details=TRUE,country_name = "Pakistan")

# Available files for SCAD data source
info_xSub(data_source = "SCAD")

# Available files for SCAD data source, event-level
info_xSub(data_source = "SCAD", data_type = "event")

# Multiple data sources, directed dyads
info_xSub(sources_type = "multiple", dyad_type = "directed")

# Multiple data sources, directed dyads, Russia
info_xSub(sources_type = "multiple", dyad_type = "directed", country_name = "Russia")



