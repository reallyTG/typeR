library(lawn)


### Name: lawn_boolean_overlap
### Title: Boolean overlap
### Aliases: lawn_boolean_overlap

### ** Examples

poly1 <- "[[[0,0],[0,5],[5,5],[5,0],[0,0]]]"
poly2 <- "[[[1,1],[1,6],[6,6],[6,1],[1,1]]]"
poly3 <- "[[[10,10],[10,15],[15,15],[15,10],[10,10]]]"
lawn_boolean_overlap(lawn_polygon(poly1), lawn_polygon(poly2))
lawn_boolean_overlap(lawn_polygon(poly2), lawn_polygon(poly3))



