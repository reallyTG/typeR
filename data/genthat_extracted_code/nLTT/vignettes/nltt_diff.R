## ----fig.width=2---------------------------------------------------------
# normalized number of lineages 
#
#  1.0 +   X---X
#      |   |
#  0.5 X---+
#      |
#      +---+---+
#         0.5 1.0   normalized time
#
#
#
# normalized number of lineages 
#
#  1.0  +       X
#  0.75 |   X---+
#  0.5  |   |
#  0.25 X---+
#       +---+---+
#         0.5 1.0   normalized time

## ------------------------------------------------------------------------
phylogeny_1 <- ape::read.tree(text = "(a:1,b:1):1;")
phylogeny_2 <- ape::read.tree(
  text = "(((d:0.000000001,c:0.000000001):1,b:1):0.000000001,a:1.000000001):1;")
ape::plot.phylo(phylogeny_1, root.edge = TRUE)
ape::plot.phylo(phylogeny_2, root.edge = TRUE)

## ------------------------------------------------------------------------
nLTT::nltt_plot(phylogeny_1, ylim = c(0,1)); nLTT::nltt_lines(phylogeny_2)

## ------------------------------------------------------------------------
nltt_stat <- nLTT::nltt_diff(phylogeny_1, phylogeny_2)
nltt_stat_exact <- nLTT::nltt_diff_exact(phylogeny_1, phylogeny_2)
testthat::expect_equal(nltt_stat, 0.25, tolerance = 0.0001)
testthat::expect_equal(nltt_stat_exact, 0.25, tolerance = 0.0001)

## ------------------------------------------------------------------------
b_times <- nLTT::get_branching_times(phylogeny_1)
lineages <- nLTT::get_n_lineages(phylogeny_1)
b_times2 <- nLTT::get_branching_times(phylogeny_2)
lineages2 <- nLTT::get_n_lineages(phylogeny_2)
df <- data.frame(b_times = b_times, lineages = lineages)
knitr::kable(df)
df2 <- data.frame(b_times2 = b_times2, lineages2 = lineages2)
knitr::kable(df2)

## ------------------------------------------------------------------------
nltt_stat_exact <- nLTT::nltt_diff_exact_brts(
  b_times = b_times,
  lineages = lineages,
  b_times2 = b_times2,
  lineages2 = lineages2,
  distance_method = "abs",
  time_unit = "ago") 

testthat::expect_equal(nltt_stat_exact, 0.25, tolerance = 0.0001)

## ------------------------------------------------------------------------
b_times_n <- nLTT::get_norm_brts(phylogeny_1)
lineages_n <- nLTT::get_norm_n(phylogeny_1)
b_times2_n <- nLTT::get_norm_brts(phylogeny_2)
lineages2_n <- nLTT::get_norm_n(phylogeny_2)
df <- data.frame(b_times_n = b_times_n, lineages_n = lineages_n)
knitr::kable(df)
df2 <- data.frame(b_times2_n = b_times2_n, lineages2_n = lineages2_n)
knitr::kable(df2)

## ------------------------------------------------------------------------
# nltt_stat_exact <- nLTT::nltt_diff_exact_norm_brts(
#   b_times_n = b_times_n,
#   lineages_n = lineages_n,
#   b_times2_n = b_times2_n,
#   lineages2_n = lineages2_n,
#   distance_method = "abs") 
# 
# testthat::expect_equal(nltt_stat_exact, 0.25, tolerance = 0.0001)

