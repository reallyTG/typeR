library(cyclestreets)


### Name: json2sf_cs
### Title: Convert output from CycleStreets.net into sf object
### Aliases: json2sf_cs

### ** Examples

from = "Leeds Rail Station"
to = "University of Leeds"
# save result from the API call to journey.json
# res_json = stplanr::route_cyclestreet(from, to, silent = FALSE, save_raw = TRUE)
# jsonlite::write_json(res_json, "inst/extdata/journey.json")
f = system.file(package = "cyclestreets", "extdata/journey.json")
obj = jsonlite::read_json(f, simplifyVector = TRUE)
rsf = json2sf_cs(obj)
sf:::plot.sf(rsf)
json2sf_cs(obj, cols = c("time", "busynance", "elevations"))



