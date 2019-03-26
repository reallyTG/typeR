context("theme_genes()")

test_that("theme_genes() works without error", { 
  expect_silent( {
    ggplot2::ggplot(
      example_genes,
      ggplot2::aes(xmin = start, xmax = end, y = molecule, fill = gene)
    ) +
      geom_gene_arrow(alpha = 0.5, linetype = 2, colour = "purple") +
      theme_genes() +
      ggplot2::facet_wrap(~ molecule, scales = "free", ncol = 1)
  } )
} )

test_that("plot with theme_genes() looks the way it should", {
  vdiffr::expect_doppelganger("Basic plot", {
    ggplot2::ggplot(
      example_genes,
      ggplot2::aes(xmin = start, xmax = end, y = molecule, fill = gene)
    ) +
      geom_gene_arrow(alpha = 0.5, linetype = 2, colour = "purple") +
      theme_genes() +
      ggplot2::facet_wrap(~ molecule, scales = "free", ncol = 1)
  } )
} )
