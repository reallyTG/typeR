library(lawn)


### Name: lawn_pt2line_distance
### Title: Minimum distance between a point and a lineString
### Aliases: lawn_pt2line_distance

### ** Examples

pt <- lawn_point("[0, 0]")
ln <- lawn_linestring("[[1, 1],[-1, 1]]")

lawn_pt2line_distance(pt, ln)
lawn_pt2line_distance(pt, ln, mercator = TRUE)

lawn_pt2line_distance(pt, ln, 'miles')
lawn_pt2line_distance(pt, ln, 'radians')
lawn_pt2line_distance(pt, ln, 'degrees')
lawn_pt2line_distance(pt, ln, mercator = TRUE)



