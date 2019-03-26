library(rosm)


### Name: extract_bbox
### Title: Extract a bounding box from an object
### Aliases: extract_bbox

### ** Examples

library(prettymapr)
ns <- makebbox(47.2, -59.7, 43.3, -66.4)
stopifnot(identical(ns, extract_bbox(ns)))

## No test: 
# downloads data, takes a long time to test
ns <- extract_bbox("nova scotia")
## End(No test)




