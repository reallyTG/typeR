## ----setupVignette, include = FALSE--------------------------------------

## NOTE:    Vignettes are built within their own environment. 
##          Therefore, changing the library paths (libpaths) here will not change the global libpaths.

# Get test library path
testLibPath <- tempdir()

# Get current library paths
origLibPaths <- .libPaths()

# Create new library paths for TESTING
.libPaths(new = c(testLibPath, origLibPaths))

# Create packages within new library
pkgnet:::.BuildTestLib(targetLibPath = testLibPath)

knitr::opts_chunk$set(
  collapse = FALSE,
  comment = "#>",
  fig.align = 'center',
  out.width='100%'
)

## ----whatIsDepGraph, echo=FALSE, message=FALSE, fig.height=3, results='markup', fig.cap = "Example Dependency Graph"----
nodes <- data.frame(
  id = 1:4
  , label = LETTERS[1:4]
  , x = c(1,3,2,4)
  , y = c(1,1,2,3)
  , level = c(1,1,2,3)
  )

edges <- data.frame(
  from = c(3,3,4,4)
  , to = c(1,2,3,2)
  )

g <- visNetwork::visNetwork(nodes = nodes
                       , edges = edges
                       , width = "100%"
                       )
g <- visNetwork::visNodes(graph = g
                          , shape = "circle"
                          , font = list(size = 25
                                        , bold = TRUE
                                        , align = 'center'
                                        )
                       )
g <- visNetwork::visEdges(graph = g
                          , arrows = "to"
                       )
g <- visNetwork::visHierarchicalLayout(graph = g
                      , direction = "DU"
                      , sortMethod = "directed"
                      )
g <- visNetwork::visInteraction(graph = g
                                , dragNodes = TRUE
                                , dragView = TRUE
                                , zoomView = FALSE)
g

## ----pkgnetRunFirst, eval=FALSE------------------------------------------
#  library(pkgnet)
#  report1 <- CreatePackageReport(pkg_name = "baseballstats")

## ----pkgnetRunFAKE, eval=FALSE-------------------------------------------
#  library(pkgnet)
#  report2 <- CreatePackageReport(
#    pkg_name = "baseballstats"
#    , pkg_path = <path to the repo>
#  )

## ----demoVis1, fig.height=3, message=FALSE, warning=FALSE, echo=FALSE----
pkgnet:::silence_logger()
funcReporter1 <- pkgnet::FunctionReporter$new()
funcReporter1$set_package('baseballstats')
funcReporter1$layout_type <- "layout_as_tree"
g <- visNetwork::visHierarchicalLayout(
    graph = funcReporter1$graph_viz
    , direction = "UD"
    , sortMethod = "directed"
    , edgeMinimization = FALSE
)
g <- visNetwork::visInteraction(graph = g
                                , dragNodes = TRUE
                                , dragView = TRUE
                                , zoomView = FALSE)
g

## ----demoVis2, fig.height=3, message=FALSE, warning=FALSE, echo=FALSE----
pkgnet:::silence_logger()
funcReporter2 <- pkgnet::FunctionReporter$new()
funcReporter2$layout_type <- "layout_as_tree"
funcReporter2$set_package(
    pkg_name = "baseballstats"
    , pkg_path = system.file('baseballstats',package="pkgnet")
)
g <- visNetwork::visHierarchicalLayout(
    graph = funcReporter2$graph_viz
    , direction = "UD"
    , sortMethod = "directed"
    , edgeMinimization = FALSE
)
g <- visNetwork::visInteraction(graph = g
                                , dragNodes = TRUE
                                , dragView = TRUE
                                , zoomView = FALSE)
g

## ----mockPackageReport, message=FALSE, warning=FALSE, results='hide', echo=FALSE----
# We initialized just the reporters because we didn't want to actually generate the full html report. So we'll put funcReporter2 into a list to mock the interface for the example
report2 <- list(FunctionReporter = funcReporter2)

## ----nodes---------------------------------------------------------------
dim(report2$FunctionReporter$nodes)
names(report2$FunctionReporter$nodes)

## ----networkMeasures-----------------------------------------------------
report2$FunctionReporter$network_measures

## ----networkObj----------------------------------------------------------
report2$FunctionReporter$pkg_graph

## ----fakeDetail1, eval=FALSE---------------------------------------------
#  # Run pkgnet
#  library(pkgnet)
#  report2 <- CreatePackageReport(
#      pkg_name = "lubridate"
#      , pkg_path = "~/pkgnet_example/lubridate"
#  )
#  
#  # Extract Nodes Table
#  funcNodes <- report2$FunctionReporter$nodes
#  
#  # List Coverage For Most Depended-on Functions
#  mostRef <- funcNodes[order(inSubgraphSize, decreasing = TRUE)][1:10]
#  mostRef[,list(`Function` = node
#                , `In-Subgraph Size` = inSubgraphSize
#                , `Coverage Ratio` = coverageRatio
#                , `Total Lines` = totalLines)]
#  

## ----fakeDetail2, eval=FALSE---------------------------------------------
#  # Get igraph object
#  funcGraph <- report2$FunctionReporter$pkg_graph
#  funcNames <- igraph::vertex_attr(funcGraph, name = "name")
#  
#  # Jaccard Similarity
#  sim <- igraph::similarity(graph = funcGraph
#                            , mode = "out"
#                            , method = "jaccard")
#  diag(sim) <- 0
#  sim[sim < 1] <- 0
#  
#  simGraph <- igraph::graph_from_adjacency_matrix(adjmatrix = sim, mode = "undirected")
#  
#  # Find groups with same out-neighbors (similarity == 1)
#  sameDeps <- igraph::max_cliques(graph = simGraph
#                                  , min = 2
#                                  )
#  
#  # Write results
#  for (i in seq_along(sameDeps)) {
#      cat(paste0("Group ", i, ": "))
#      cat(paste(funcNames[as.numeric(sameDeps[[i]])], collapse = ", "))
#      cat("\n")
#  }

## ----resultFromFake, echo=FALSE, results='markup'------------------------
cat("Group 1: stamp_time, stamp_date
Group 2: ms, hm
Group 3: new_interval, %--%, int_diff
Group 4: floor_date, quarter, semester
Group 5: picoseconds, microseconds, nanoseconds, milliseconds
Group 6: weeks, days, years, seconds_to_period, seconds, new_period, minutes, hours
Group 7: yq, dmy, ymd_hms, ymd_hm, ymd_h, ymd, ydm_hms, ydm_hm, ydm_h, ydm, pretty_dates, parse_date_time2, parse_date_time, myd, mdy_hms, mdy_hm, mdy_h, mdy, local_time, fast_strptime, dym, dmy_hms, dmy_hm, dmy_h
"
)

## ----removeDemoPackage, include=FALSE------------------------------------
utils::remove.packages(
    pkgs = c('baseballstats', 'sartre', 'pkgnet')
    , lib = testLibPath
)

# Just in case 
.libPaths(new = c(origLibPaths))
unlink(testLibPath)

