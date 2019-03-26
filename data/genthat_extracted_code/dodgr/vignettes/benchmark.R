## ---- echo = FALSE, message = FALSE--------------------------------------
devtools::load_all (".", export_all = FALSE)

## ------------------------------------------------------------------------
datasets <- data (package = "igraphdata")
datasets <- datasets$results [, "Item"]

all_graphs <- list ()
gr_el <- 1

for (i in seq_along (datasets))
{
    dat <- datasets [i]
    data (package = "igraphdata", list = dat)
    dat_graph <- get (dat)
    if (class (dat_graph) == "igraph")
        dat_graph <- list (dat_graph)
    for (j in seq_along (dat_graph))
    {
        graph <- dat_graph [[j]]
        graph <- igraph::get.data.frame (graph)
        from_id <- graph$from
        to_id <- graph$to
        if ("weight" %in% names (graph))
            d <- graph$weight
        else
            d <- 1

        graph_out <- data.frame (from_id, to_id, d)
        all_graphs [[gr_el]] <- graph_out
        gr_el <- gr_el + 1
    }
}

## ------------------------------------------------------------------------
num_edges <- unlist (lapply (all_graphs, nrow))
num_vertices <- unlist (lapply (all_graphs, function (i)
                                nrow (dodgr_vertices (i))))
data.frame (num_edges, num_vertices, ratio = num_edges / num_vertices)

## ---- eval = FALSE-------------------------------------------------------
#  benchmarks <- lapply (all_graphs, function (i)
#                        compare_heaps (i, nverts = 100, replications = 10))
#  saveRDS (benchmarks, file = "benchmark_data.rds")

## ---- eval = FALSE-------------------------------------------------------
#  benchmarks <- readRDS ("benchmark_data.rds")
#  elapsed <- unlist (purrr::map (benchmarks, "elapsed"))
#  tests <- unlist (purrr::map (benchmarks, "test"))
#  tests <- as.character (tests)
#  tests <- sub ("d <- dodgr_dists\\(graph, from = from_id, to = to_id, heap =",
#       "Contracted", tests)
#  p <- "d <- dodgr_dists\\(graph_contracted, from = from_id, to = to_id, heap = "
#  tests <- sub (p, "", tests)
#  tests [grepl ("igraph", tests)] <- "igraph"
#  tests <- gsub ("\"", "", tests)
#  tests <- gsub ("\\)", "", tests)
#  tests <- as.factor (tests)
#  n_tests <- dim (benchmarks [[1]]) [1]
#  ratio <- rep (num_edges / num_vertices, each = n_tests)
#  num_vertices <- rep (num_vertices, each = n_tests)
#  num_edges <- rep (num_edges, each = n_tests)
#  bm <- data.frame (num_vertices, num_edges, ratio, Test = tests, elapsed)

## ----fig.width = 12, fig.height = 8, eval = FALSE------------------------
#  library (ggplot2)
#  library (RColorBrewer)
#  library (scales)
#  
#  bm_igraph <- bm [bm$Test == "igraph", ]
#  bm_heaps <- bm [bm$Test != "igraph", ]
#  igr_legend_num <- which (sort (unique (bm$Test)) == "igraph")
#  pal <- brewer_pal (n_tests, "Paired")
#  legend_cols <- pal (n_tests)
#  legend_cols [igr_legend_num] <- "#000000FF"
#  
#  ggplot (bm_heaps) +
#      geom_line (size = 0.8, aes (x = ratio, y = elapsed, colour = Test)) +
#      geom_point (size = 1.5, aes (x = ratio, y = elapsed, colour = Test)) +
#      geom_line (data = bm_igraph, size = 1.1, aes (x = ratio, y = elapsed, colour = "igraph")) +
#      geom_point (data = bm_igraph, size = 1.5, aes (x = ratio, y = elapsed, colour = "igraph")) +
#      scale_color_manual (values = legend_cols) +
#      scale_x_log10 (breaks = trans_breaks ("log10", function (x) 10^x),
#                     labels = trans_format ("log10", math_format (10^.x))) +
#      scale_y_log10 (breaks = trans_breaks ("log10", function (x) 10^x),
#                     labels = trans_format ("log10", math_format (10^.x))) +
#      labs (title = "dodgr benchmark results",
#            x = "Ratio of edges to vertices (log scale)",
#            y = "Runtime [s] (log scale)") +
#      theme_bw (base_family = "TeX Gyre Bonum") +
#      theme (plot.title = element_text(hjust = 0.5),
#                      legend.box.background = element_rect ())

