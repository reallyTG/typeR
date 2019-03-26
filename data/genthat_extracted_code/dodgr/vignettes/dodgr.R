## ----pkg-load, echo = FALSE, message = FALSE-----------------------------
devtools::load_all (".", export_all = FALSE)

## ----sample-graph1, echo = FALSE-----------------------------------------
graph <- data.frame (from = c ("A", "B", "B", "B", "C", "C", "D", "D"),
                     to = c ("B", "A", "C", "D", "B", "D", "C", "A"),
                     d = c (1, 2, 1, 3, 2, 1, 2, 1))
graph

## ----sample-dists1-------------------------------------------------------
dodgr_dists (graph)
dodgr_dists (graph, from = c ("A", "C"), to = c ("B", "C", "D"))

## ----sample-graph2, echo = FALSE-----------------------------------------
graph <- data.frame (from = c ("A", "B", "B", "B", "C", "C", "D", "D"),
                     to = c ("B", "A", "C", "D", "B", "D", "C", "A"),
                     w = c (1, 2, 1, 3, 2, 1, 2, 1),
                     d = c (1, 1, 1, 1, 1, 1, 1, 1))
graph
dodgr_dists (graph)

## ----get-york-data, eval = FALSE-----------------------------------------
#  bb <- osmdata::getbb ("york uk")
#  npts <- 1000
#  xy <- apply (bb, 1, function (i) min (i) + runif (npts) * diff (i))
#  bb; head (xy)

## ----york-bb, echo = FALSE-----------------------------------------------
bb <- rbind (c (-1.241536, -0.9215361), c (53.799056, 54.1190555))
rownames (bb) <- c ("x", "y")
colnames (bb) <- c ("min", "max")
bb
x <- c (-1.1713502, -1.2216108, -1.0457199, -0.9384666, -0.9445541, -1.1207099)
y <- c (53.89409, 54.01065, 53.83613, 53.93545, 53.89436, 54.01262)
cbind (x, y)

## ----dodgr-dists-in-york, eval = FALSE-----------------------------------
#  system.time(
#              d <- dodgr_dists (from = xy, to = xy,
#                                wt_profile = "foot", quiet = FALSE)
#              )

## ----dists-york-message, echo = FALSE------------------------------------
message (paste0 ("No graph submitted to dodgr_dists; ",
                 "downloading street network ... done\n",
                 "Converting network to dodgr graph ... done\n",
                 "Calculating shortest paths ... done"))

## ----dists-york-time, echo = FALSE---------------------------------------
st <- system.time (Sys.sleep (0.1))
st [1] <- 26.620
st [2] <- 0.132
st [3] <- 28.567
st

## ----dists-york-structure, eval = FALSE----------------------------------
#  dim (d); range (d, na.rm = TRUE)

## ----dists-york-output, echo = FALSE-------------------------------------
c (1000, 1000)
c (0.00000, 46.60609)

## ----get-hampi-code, eval = FALSE----------------------------------------
#  hampi <- dodgr_streetnet ("hampi india")

## ----hampi-call----------------------------------------------------------
class (hampi)

## ----hampi-geom-class----------------------------------------------------
class (hampi$geometry)

## ----hampi-dim-----------------------------------------------------------
dim (hampi)

## ----hampi-osmplotr, eval = FALSE----------------------------------------
#  library (osmplotr)
#  library (magrittr)
#  map <- osm_basemap (hampi, bg = "gray95") %>%
#      add_osm_objects (hampi, col = "gray5") %>%
#      add_axes () %>%
#      print_osm_map ()

## ----load-magritr, echo = FALSE, message = FALSE-------------------------
library (magrittr)

## ----hampi-osmplotr-to-file, echo = FALSE, eval = FALSE------------------
#  map <- osm_basemap (hampi, bg = "gray95") %>%
#      add_osm_objects (hampi, col = "gray5") %>%
#      add_axes () %>%
#      print_osm_map (filename = "hampi.png", width = 2000, units = "px")

## ----hampi-weight_streetnet----------------------------------------------
graph <- weight_streetnet (hampi, wt_profile = "foot")
dim (graph)

## ----hampi-head----------------------------------------------------------
head (graph)

## ----hampi-verts---------------------------------------------------------
vt <- dodgr_vertices (graph)
head(vt)

## ----hampi-verts-out-----------------------------------------------------
dim (vt)

## ----hampi-edge2vert-----------------------------------------------------
nrow (graph) / nrow (vt)

## ----hampi-components----------------------------------------------------
table (graph$component)

## ----hampi-num-components------------------------------------------------
length (unique (graph$component))

## ----hampi-graph-min-----------------------------------------------------
cols <- c ("edge_id", "from_id", "to_id", "d")
graph_min <- graph [, which (names (graph) %in% cols)]
graph_min <- dodgr_components (graph_min)
head (graph_min)

## ----hampi-connected-----------------------------------------------------
graph_connected <- graph [graph$component == 1, ]

## ----weighting-profiles--------------------------------------------------
names (weighting_profiles)
class (weighting_profiles)
unique (weighting_profiles$name)
weighting_profiles [weighting_profiles$name == "foot", ]

## ----hampi-highway-types-------------------------------------------------
table (graph$highway)

## ----hampi-bristol-comp--------------------------------------------------
names (hampi) # many fields manually removed to reduce size of this object
names (os_roads_bristol)

## ----wt-bristol----------------------------------------------------------
colnm <- "formOfWay"
table (os_roads_bristol [[colnm]])
wts <- c (0.1, 0.2, 0.8, 1)
names (wts) <- unique (os_roads_bristol [[colnm]])
net <- weight_streetnet (os_roads_bristol, wt_profile = wts,
                         type_col = colnm, id_col = "identifier")

## ----dodgr-sample--------------------------------------------------------
graph_sub <- dodgr_sample (graph, nverts = 100)
nrow (graph_sub)

## ----dodgr-sample-verts--------------------------------------------------
nrow (dodgr_vertices (graph_sub))

## ----verts-to-points-----------------------------------------------------
vt <- dodgr_vertices (graph)
n <- 100 # number of points to generate
xy <- data.frame (x = min (vt$x) + runif (n) * diff (range (vt$x)),
                  y = min (vt$y) + runif (n) * diff (range (vt$y)))

## ----dodogr-dists-structure----------------------------------------------
d <- dodgr_dists (graph, from = xy)
dim (d); range (d, na.rm = TRUE)

## ----dodogr-dists-structure2---------------------------------------------
d <- dodgr_dists (graph, from = xy, to = xy [1:10, ])
dim (d)

## ----main-component------------------------------------------------------
graph_connected <- graph [graph$component == 1, ]

## ----york-streetnet, eval = FALSE----------------------------------------
#  bb <- osmdata::getbb ("york uk")
#  npts <- 100
#  xy <- apply (bb, 1, function (i) min (i) + runif (npts) * diff (i))
#  routed_points <- function (expand = 0, pts)
#  {
#      gr0 <- dodgr_streetnet (pts = pts, expand = expand) %>%
#          weight_streetnet ()
#      d0 <- dodgr_dists (gr0, from = pts)
#      length (which (is.na (d0))) / length (d0)
#  }

## ----york-streetnet-output, eval = FALSE---------------------------------
#  vapply (c (0, 0.05, 0.1), function (i) routed_points (i, pts = xy),
#          numeric (1))

## ----york-streetntet-values, echo = FALSE--------------------------------
c (0.078, 0.0586, 0)

## ----york-streetnet-graph-head-------------------------------------------
head (graph [, names (graph) %in% c ("from_id", "to_id", "d")])

## ----york-streetnet-graph-strucutre--------------------------------------
graph_min <- graph [, names (graph) %in% c ("from_id", "to_id", "d")]
fr <- sample (graph_min$from_id, size = 10) # 10 random points
to <- sample (graph_min$to_id, size = 20)
d <- dodgr_dists (graph_min, from = fr, to = to)
dim (d)

## ----compare-heaps-------------------------------------------------------
compare_heaps (graph, nverts = 100, replications = 1)

## ----graph-code, eval = FALSE--------------------------------------------
#  edges <- cbind (graph$from_id, graph$to_id)
#  pts <- sample (unique (as.vector (edges)), 100) # set of random routing points
#  edges <- as.vector (t (edges))
#  igr <- igraph::make_directed_graph (edges)
#  igraph::E (igr)$weight <- graph$d
#  d <- igraph::distances (igr, v = pts, to = pts, mode = "out")

## ----contract-graph------------------------------------------------------
grc <- dodgr_contract_graph (graph)$graph

## ----contract-graph-structure--------------------------------------------
nrow (graph); nrow (grc); nrow (grc) / nrow (graph)

## ----benchmark1----------------------------------------------------------
from <- sample (grc$from_id, size = 100)
to <- sample (grc$to_id, size = 100)
rbenchmark::benchmark (
                       d2 <- dodgr_dists (grc, from = from, to = to),
                       d2 <- dodgr_dists (graph, from = from, to = to),
                       replications = 2)

## ----contracted-with-verts-----------------------------------------------
grc <- dodgr_contract_graph (graph)$graph
nrow (grc)
verts <- sample (dodgr_vertices (graph)$id, size = 100)
head (verts) # a character vector
grc <- dodgr_contract_graph (graph, verts)$graph
nrow (grc)

## ------------------------------------------------------------------------
dp <- dodgr_paths (graph, from = from, to = to)

## ------------------------------------------------------------------------
graph <- weight_streetnet (hampi)
head (graph)

## ------------------------------------------------------------------------
from <- sample (graph$from_id, size = 10)
to <- sample (graph$to_id, size = 5)
dp <- dodgr_paths (graph, from = from, to = to)
length (dp)

## ---- eval = FALSE-------------------------------------------------------
#  dp [[1]] [[1]]

## ---- echo = FALSE-------------------------------------------------------
# make sure there are some paths:
maxlen <- max (unlist (lapply (dp, function (i)
                               max (unlist (lapply (i, length))))))
if (maxlen > 0)
{
    n <- 0
    i <- 0
    while (all (n == 0))
    {
        i <- i + 1
        n <- which (lapply (dp [[i]], length) > 0)
    }
    j <- n [1]
    dp [[i]] [[j]]
}

## ---- eval = FALSE-------------------------------------------------------
#  verts <- dodgr_vertices (graph)
#  path1 <- verts [match (dp [[1]] [[1]], verts$id), ]
#  head (path1)

## ---- echo = FALSE-------------------------------------------------------
verts <- dodgr_vertices (graph)
path1 <- verts [match (dp [[i]] [[j]], verts$id), ]
head (path1)

## ------------------------------------------------------------------------
graph <- weight_streetnet (hampi)
from <- sample (graph$from_id, size = 10)
to <- sample (graph$to_id, size = 10)
flows <- matrix (10 * runif (length (from) * length (to)),
                 nrow = length (from))

## ------------------------------------------------------------------------
graph_f <- dodgr_flows_aggregate (graph, from = from, to = to, flows = flows)
head (graph_f)

## ------------------------------------------------------------------------
summary (graph_f$flow)

## ------------------------------------------------------------------------
dens <- rep (1, length (from)) # uniform densities
graph_f <- dodgr_flows_disperse (graph, from = from, dens = dens)
summary (graph_f$flow)

## ------------------------------------------------------------------------
graph_undir <- merge_directed_flows (graph_f)

## ------------------------------------------------------------------------
nrow (graph_f); nrow (graph_undir) # the latter is much smaller

## ------------------------------------------------------------------------
graph <- graph [graph_undir$edge_id, ]
graph$flow <- graph_undir$flow

## ------------------------------------------------------------------------
graph_f <- graph_f [graph_f$flow > 0, ]
dodgr_flowmap (graph_f, linescale = 5)

