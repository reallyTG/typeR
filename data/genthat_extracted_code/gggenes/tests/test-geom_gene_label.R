context("geom_gene_label()")

test_that("geom_gene_label() works without errors", {
  expect_silent({
  ggplot2::ggplot(
    example_genes,
    ggplot2::aes(xmin = start, xmax = end, y = molecule, label = gene)
    ) +
    geom_gene_arrow() +
    geom_gene_label() +
    ggplot2::facet_wrap(~ molecule, scales = "free", ncol = 1)
  } )
} )

test_that("plot with geom_gene_label() looks the way it should", {
  vdiffr::expect_doppelganger("Basic plot", {
  ggplot2::ggplot(
    example_genes,
    ggplot2::aes(xmin = start, xmax = end, y = molecule, label = gene)
    ) +
    geom_gene_arrow() +
    geom_gene_label() +
    ggplot2::facet_wrap(~ molecule, scales = "free", ncol = 1)
  } )
} )
