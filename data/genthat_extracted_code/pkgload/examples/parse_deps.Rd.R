library(pkgload)


### Name: parse_deps
### Title: Parse package dependency strings.
### Aliases: parse_deps
### Keywords: internal

### ** Examples

parse_deps("httr (< 2.1),\nRCurl (>= 3)")
# only package dependencies are returned
parse_deps("utils (== 2.12.1),\ntools,\nR (>= 2.10),\nmemoise")



