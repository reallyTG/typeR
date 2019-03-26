## ----setup, include=FALSE------------------------------------------------
library("dtwclust")
library("dplyr")
library("ggplot2")
data("dtwclustTimings")

dist_single_results <- dtwclustTimings$dist$single
dist_multiple_results <- dtwclustTimings$dist$multiple
cent_results <- dtwclustTimings$cent
clus_tadpole_results <- dtwclustTimings$tadpole
partitional_results <- dtwclustTimings$partitional

factor_columns <- c("series_length", "window_size", "k", "num_repetitions")
adjust_factors <- function(df) {
    for (column in factor_columns) {
        if (column %in% colnames(df)) {
            df[[column]] <- factor(df[[column]])
        }
    }
    df
}

dist_single_results <- adjust_factors(dist_single_results)
dist_multiple_results <- adjust_factors(dist_multiple_results)
cent_results <- adjust_factors(cent_results)
clus_tadpole_results <- adjust_factors(clus_tadpole_results)
partitional_results$dtwlb_vs_dtwbasic$pam <- adjust_factors(partitional_results$dtwlb_vs_dtwbasic$pam)
partitional_results$dtwlb_vs_dtwbasic$pam_vs_reps <- adjust_factors(partitional_results$dtwlb_vs_dtwbasic$pam_vs_reps)
partitional_results$dtwlb_vs_dtwbasic$dba <- adjust_factors(partitional_results$dtwlb_vs_dtwbasic$dba)
partitional_results$sparse_pam_k$non_symmetric <- adjust_factors(partitional_results$sparse_pam_k$non_symmetric)
partitional_results$sparse_pam_k$symmetric <- adjust_factors(partitional_results$sparse_pam_k$symmetric)

levels(dist_single_results$distance) <- c(
    lb_keogh = "LB Keogh",
    lb_improved = "LB Improved",
    sbd = "Shape-Based Distance",
    dtw_univariate = "DTW (Univariate)",
    dtw_multivariate = "DTW (Multivariate)",
    sdtw_univariate = "Soft-DTW (Univariate)",
    sdtw_multivariate = "Soft-DTW (Multivariate)",
    unnormalized_gak_univariate = "Unnormalized GAK (Univariate)",
    unnormalized_gak_multivariate = "Unnormalized GAK (Multivariate)",
    normalized_gak_univariate = "Normalized GAK (Univariate)",
    normalized_gak_multivariate = "Normalized GAK (Multivariate)"
)
levels(dist_multiple_results$distance) <- c(
    lb_keogh = "LB Keogh",
    lb_improved = "LB Improved",
    dtw_lb = "LBI + DTW",
    sbd = "Shape-Based Distance",
    dtw_univariate = "DTW (Univariate)",
    dtw_multivariate = "DTW (Multivariate)",
    sdtw_univariate = "Soft-DTW (Univariate)",
    gak_univariate = "Normalized GAK (Univariate)"
)
levels(cent_results$cent) <- c(
    shape_univariate = "Shape Extraction (Univariate)",
    shape_multivariate = "Shape Extraction (Multivariate)",
    dba_univariate = "DBA (Univariate)",
    dba_multivariate_byS = "DBA (Multivariate By Series)",
    dba_multivariate_byV = "DBA (Multivariate By Variable)",
    sdtw_cent_univariate = "Soft-DTW (Univariate)",
    sdtw_cent_multivariate = "Soft-DTW (Multivariate)"
)

dist_multiple_results$num_threads <- factor(
    dist_multiple_results$num_threads,
    levels = unique(dist_multiple_results$num_threads),
    labels = paste(unique(dist_multiple_results$num_threads), " Thread(s)")
)
clus_tadpole_results$lb <- factor(
    clus_tadpole_results$lb,
    levels = c("lbk", "lbi"),
    labels = c("LB Keogh", "LB Improved")
)

# execution time
exec_time <- attr(dist_single_results, "proctime")["elapsed"] +
    attr(dist_multiple_results, "proctime")["elapsed"] +
    attr(cent_results, "proctime")["elapsed"] +
    attr(clus_tadpole_results, "proctime")["elapsed"] +
    attr(partitional_results, "proctime")["elapsed"]
exec_time <- unname(round(exec_time / 3600))

# ggplot defaults
ggplot2::theme_set(ggplot2::theme_bw())
ggplot2::theme_update(legend.position = "bottom")

# knitr defaults
knitr::opts_chunk$set(echo = FALSE, comment = "#>")

## ----dist-single-lb, fig.height=4.5--------------------------------------
id_gg <- grepl("^LB", dist_single_results$distance)
gg <- ggplot(dist_single_results[id_gg,], aes(
    x = series_length,
    y = median_time_us,
    group = window_size,
    colour = window_size
))
gg +
    geom_line() +
    facet_wrap(~distance) +
    scale_color_discrete(name = "Window size") +
    labs(x = "Series' length",
         y = expression("Median time ("*mu*"s)"))

## ----dist-single-sbd, fig.height=3.5, fig.width=5------------------------
id_gg <- grepl("^Shape", dist_single_results$distance)
gg <- ggplot(dist_single_results[id_gg,], aes(
    x = series_length,
    y = median_time_us,
    group = 1
))
gg +
    geom_line() +
    labs(x = "Series' length",
         y = expression("Median time ("*mu*"s)"))

## ----dist-single-dtw, fig.height=4.5-------------------------------------
id_gg <- grepl("^DTW", dist_single_results$distance)
gg <- ggplot(dist_single_results[id_gg,], aes(
    x = series_length,
    y = median_time_us,
    group = window_size,
    colour = window_size
))
gg +
    geom_line() +
    facet_wrap(~distance) +
    scale_color_discrete(name = "Window size") +
    labs(x = "Series' length",
         y = expression("Median time ("*mu*"s)"))

## ----dist-single-sdtw, fig.height=4--------------------------------------
id_gg <- grepl("^Soft-DTW", dist_single_results$distance)
gg <- ggplot(dist_single_results[id_gg,], aes(
    x = series_length,
    y = median_time_us,
    group = 1
))
gg +
    geom_line() +
    facet_wrap(~distance) +
    labs(x = "Series' length",
         y = expression("Median time ("*mu*"s)"))

## ----dist-single-gak, fig.height=6---------------------------------------
id_gg <- grepl("GAK", dist_single_results$distance)
gg <- ggplot(dist_single_results[id_gg,], aes(
    x = series_length,
    y = median_time_us,
    group = window_size,
    colour = window_size
))
gg +
    geom_line() +
    facet_wrap(~distance) +
    scale_color_discrete(name = "Window size") +
    labs(x = "Series' length",
         y = expression("Median time ("*mu*"s)"))

## ----dist-multiple-lb-plot, fig.cap="*The facets' columns indicate the number of parallel threads, whereas the rows indicate the distance that was used. The vertical scales are different for each row, but they are all in milliseconds.*"----
id_gg <- grepl("LB", dist_multiple_results$distance)
ggplot(dist_multiple_results[id_gg,],
       aes(x = num_total,
           y = median_time_ms,
           colour = num_y,
           shape = series_length)) +
    geom_point(size = 3) +
    facet_grid(distance ~ num_threads, scales = "free_y") +
    scale_color_continuous(name = "Amount of series in y") +
    scale_shape_discrete(name = "Series' length") +
    labs(x = "Total number of distance calculations",
         y = "Median time (ms)")

## ----dist-multiple-sbd-plot, fig.height=4.5, fig.cap="*The facets' columns indicate the number of parallel threads.*"----
id_gg <- grepl("^Shape", dist_multiple_results$distance)
ggplot(dist_multiple_results[id_gg,],
       aes(x = num_total,
           y = median_time_ms,
           colour = series_length)) +
    geom_point(size = 3) +
    facet_wrap(~num_threads) +
    scale_color_discrete(name = "Series' length") +
    labs(x = "Total number of distance calculations",
         y = "Median time (ms)")

## ----dist-multiple-dtw-plot, fig.height=8, fig.cap="*The facets' columns indicate the number of parallel threads, whereas the rows indicate the length of the series being considered (all series had the same length for each case). All times are in milliseconds.*"----
id_gg <- grepl("^DTW \\(", dist_multiple_results$distance)
ggplot(dist_multiple_results[id_gg,],
       aes(x = num_total,
           y = median_time_ms,
           colour = window_size,
           shape = distance)) +
    geom_point(size = 3) +
    facet_grid(series_length ~ num_threads) +
    scale_shape_manual(name = "Distance", values = c(0, 3)) +
    scale_color_discrete(name = "Window size") +
    labs(x = "Total number of distance calculations",
         y = "Median time (ms)")

## ----dist-multiple-sdtw-plot, fig.height=4.5, fig.cap="*The facets' columns indicate the number of parallel threads. All times are in milliseconds.*"----
id_gg <- grepl("^Soft", dist_multiple_results$distance)
ggplot(dist_multiple_results[id_gg,],
       aes(x = num_total,
           y = median_time_ms,
           colour = series_length)) +
    geom_point(size = 3) +
    facet_wrap(~num_threads) +
    scale_color_discrete(name = "Series' length") +
    labs(x = "Total number of distance calculations",
         y = "Median time (ms)")

## ----dist-multiple-gak-plot, fig.height=6, fig.cap="*The facets' columns indicate the number of parallel threads, whereas the rows indicate the window size that was used. All times are in milliseconds.*"----
id_gg <- grepl("GAK", dist_multiple_results$distance)
ggplot(dist_multiple_results[id_gg,],
       aes(x = num_total,
           y = median_time_ms,
           colour = series_length)) +
    geom_point(size = 3) +
    facet_grid(window_size ~ num_threads) +
    scale_color_discrete(name = "Series' length") +
    labs(x = "Total number of distance calculations",
         y = "Median time (ms)")

## ----cent-shape-plot, fig.height=5---------------------------------------
id_gg <- grepl("^Shape", cent_results$cent)
ggplot(cent_results[id_gg,],
       aes(x = num_series,
           y = median_time_ms,
           colour = series_length)) +
    geom_line() +
    geom_point(size = 2) +
    facet_wrap(~cent) +
    scale_color_discrete(name = "Series' length") +
    labs(x = "Amount of time-series considered",
         y = "Median time (ms)")

## ----cent-dba-plot, fig.height=20, fig.cap="*The facets' rows indicate the DBA version and the window size used. The facet's columns indicate how many threads were used. Note the different vertical scales for each row of the facets.*"----
id_gg <- grepl("^DBA", cent_results$cent)
ggplot(cent_results[id_gg,],
       aes(x = num_series,
           y = median_time_ms,
           colour = series_length)) +
    geom_line() +
    geom_point(size = 1.5) +
    facet_grid(cent + window_size ~ num_threads, scales = "free") +
    scale_color_discrete(name = "Series' length") +
    labs(x = "Amount of time-series considered",
         y = "Median time (ms)")

## ----cent-sdtwc-plot, fig.height=7, fig.cap="*The facets' rows indicate the centroid tested, and the columns show how many threads were used. Note the different vertical scales for each row of the facets.*"----
id_gg <- grepl("^Soft", cent_results$cent)
ggplot(cent_results[id_gg,],
       aes(x = num_series,
           y = median_time_ms,
           colour = series_length)) +
    geom_line() +
    geom_point(size = 2) +
    facet_grid(cent ~ num_threads, scales = "free") +
    scale_color_discrete(name = "Series' length") +
    labs(x = "Amount of time-series considered",
         y = "Median time (ms)")

## ----clust-tadpole-plot--------------------------------------------------
ggplot(clus_tadpole_results,
       aes(x = num_series,
           y = median_time_s,
           colour = window_size)) +
    geom_line() +
    geom_point(size = 2) +
    facet_wrap(~lb) +
    scale_color_discrete(name = "Window size") +
    labs(x = "Number of time-series in the data",
         y = "Median time (s)")

## ----clust-part-dtw-pam-plot, fig.height=5-------------------------------
ggdf <- reshape2::melt(partitional_results$dtwlb_vs_dtwbasic$pam, 
                       id.vars=c("num_series", "k", "window_size"))
levels(ggdf$variable) <- c("DTW (Full Pre-Computation)", "DTW (Sparse Matrix)", "LBI + DTW")
ggplot(ggdf,
       aes(x = num_series,
           y = value,
           colour = window_size)) +
    geom_line() +
    geom_point(size = 2) +
    facet_wrap(~variable) +
    scale_color_discrete(name = "Window size") +
    labs(x = "Number of time-series in the data",
         y = "Median time (s)")

## ----clust-part-dtw-pam-reps-plot, fig.height=5, fig.cap="*The window size was fixed at 20 for these experiments.*"----
cols <- setdiff(colnames(partitional_results$dtwlb_vs_dtwbasic$pam_vs_reps),
                "sparse_distmat_filled_percent")
ggdf <- reshape2::melt(partitional_results$dtwlb_vs_dtwbasic$pam_vs_reps[,cols], 
                       id.vars=c("num_series", "k", "num_repetitions"))
levels(ggdf$variable) <- c("DTW (Full Pre-Computation)", "DTW (Sparse Matrix)", "LBI + DTW")
ggplot(ggdf,
       aes(x = num_series,
           y = value,
           colour = num_repetitions)) +
    geom_line() +
    geom_point(size = 2) +
    facet_wrap(~variable) +
    scale_color_discrete(name = "Number of repetitions") +
    labs(x = "Number of time-series in the data",
         y = "Median time (s)")

## ----clust-part-dtw-pam-reps-distmat-plot, fig.height=5------------------
ggplot(partitional_results$dtwlb_vs_dtwbasic$pam_vs_reps,
       aes(x = num_series,
           y = sparse_distmat_filled_percent,
           colour = num_repetitions)) +
    geom_line() +
    geom_point(size = 2) +
    scale_color_discrete(name = "Number of repetitions") +
    labs(x = "Number of time-series in the data",
         y = "Percentage of non-zero entries in the sparse matrix")

## ----clust-part-dtw-dba-plot, fig.height=5-------------------------------
ggdf <- reshape2::melt(partitional_results$dtwlb_vs_dtwbasic$dba, 
                       id.vars=c("num_series", "k", "window_size"))
levels(ggdf$variable) <- c("DTW", "LBI + DTW")
ggplot(ggdf,
       aes(x = num_series,
           y = value,
           colour = window_size)) +
    geom_line() +
    geom_point(size = 2) +
    facet_wrap(~variable) +
    scale_color_discrete(name = "Window size") +
    labs(x = "Number of time-series in the data",
         y = "Median time (s)")

## ----clust-part-sparse-pam-k-nonsymmetric-plot, fig.height=5-------------
cols <- setdiff(colnames(partitional_results$sparse_pam_k$non_symmetric),
                "sparse_distmat_filled_percent")
ggdf <- reshape2::melt(partitional_results$sparse_pam_k$non_symmetric[,cols], 
                       id.vars=c("num_series", "k"))
levels(ggdf$variable) <- c("Full Matrix Pre-Computation", "Sparse Matrix")
ggplot(ggdf,
       aes(x = num_series,
           y = value,
           colour = k)) +
    geom_line() +
    geom_point(size = 2) +
    scale_color_discrete(name = "Amount of clusters") +
    facet_wrap(~variable) +
    labs(x = "Number of time-series in the data",
         y = "Median time (s)")

ggplot(partitional_results$sparse_pam_k$non_symmetric,
       aes(x = num_series,
           y = sparse_distmat_filled_percent,
           colour = k)) +
    geom_line() +
    geom_point(size = 2) +
    scale_color_discrete(name = "Amount of clusters") +
    labs(x = "Number of time-series in the data",
         y = "Percentage of non-zero entries in the sparse matrix")

## ----clust-part-sparse-pam-k-symmetric-plot, fig.height=5----------------
cols <- setdiff(colnames(partitional_results$sparse_pam_k$symmetric),
                "sparse_distmat_filled_percent")
ggdf <- reshape2::melt(partitional_results$sparse_pam_k$symmetric[,cols], 
                       id.vars=c("num_series", "k"))
levels(ggdf$variable) <- c("Full Matrix Pre-Computation", "Sparse Matrix")
ggplot(ggdf,
       aes(x = num_series,
           y = value,
           colour = k)) +
    geom_line() +
    geom_point(size = 2) +
    scale_color_discrete(name = "Amount of clusters") +
    facet_wrap(~variable) +
    labs(x = "Number of time-series in the data",
         y = "Median time(s)")

ggplot(partitional_results$sparse_pam_k$symmetric,
       aes(x = num_series,
           y = sparse_distmat_filled_percent,
           colour = k)) +
    geom_line() +
    geom_point(size = 2) +
    scale_color_discrete(name = "Amount of clusters") +
    labs(x = "Number of time-series in the data",
         y = "Percentage of non-zero entries in the sparse matrix")

