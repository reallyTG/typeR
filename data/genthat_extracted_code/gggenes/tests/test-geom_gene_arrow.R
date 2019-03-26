context("geom_gene_arrow()")

test_that("geom_gene_arrow() works without errors", { 
  expect_silent( {
    example_genes$strand <- example_genes$strand == "forward"
    ggplot2::ggplot(
      example_genes,
      ggplot2::aes(xmin = start, xmax = end, y = molecule, fill = gene, forward = strand)) +
      geom_gene_arrow() +
      ggplot2::facet_wrap(~ molecule, scales = "free", ncol = 1)
  } )
} )

test_that("plot with geom_gene_arrow() looks the way it should", {
  vdiffr::expect_doppelganger("Basic plot", {
    example_genes$strand <- example_genes$strand == "forward"
    ggplot2::ggplot(
      example_genes,
      ggplot2::aes(xmin = start, xmax = end, y = molecule, fill = gene, forward = strand)) +
      geom_gene_arrow() +
      ggplot2::facet_wrap(~ molecule, scales = "free", ncol = 1)
  } )
} )
