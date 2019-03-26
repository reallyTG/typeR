library(dodgr)


### Name: match_pts_to_graph
### Title: match_pts_to_graph
### Aliases: match_pts_to_graph

### ** Examples

net <- weight_streetnet (hampi, wt_profile = "foot")
verts <- dodgr_vertices (net)
# Then generate some random points to match to graph
npts <- 10
xy <- data.frame (
                  x = min (verts$x) + runif (npts) * diff (range (verts$x)),
                  y = min (verts$y) + runif (npts) * diff (range (verts$y))
                  )
pts <- match_pts_to_graph (verts, xy)
pts # an index into verts
pts <- verts$id [pts]
pts # names of those vertices



