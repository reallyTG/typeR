library(maps)


### Name: area.map
### Title: Area of projected map regions
### Aliases: area.map
### Keywords: dplot

### ** Examples

# because the projection is rectangular, these are not true areas on the globe.
m = map("state", fill = TRUE, plot = FALSE)
area.map(m)
area.map(m, ".*dakota")
area.map(m, c("North Dakota", "South Dakota"))

if(require(mapproj)) {
  # true areas on the globe
  m = map("state", proj="bonne", param=45, fill=TRUE, plot=FALSE)
  # North Dakota is listed as 70,704 square miles
  area.map(m, "North Dakota")
}



