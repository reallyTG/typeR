context("make_alignment_dummies()")

test_that("make_alignment_dummies() works without errors", {
  expect_silent( {
    dummies <- make_alignment_dummies(
      example_genes,
      ggplot2::aes(xmin = start, xmax = end, y = molecule, id = gene),
      on = "genE",
      side = "right"
    )
    ggplot2::ggplot(
      example_genes,
      ggplot2::aes(xmin = start, xmax = end, y = molecule, fill = gene)
      ) +
      geom_gene_arrow() +
      ggplot2::geom_blank(data = dummies) +
      ggplot2::facet_wrap(~ molecule, scales = "free", ncol = 1)
  } )
} )

test_that("plot with make_alignment_dummies() looks the way it should", {
  vdiffr::expect_doppelganger("Basic plot", {
    dummies <- make_alignment_dummies(
      example_genes,
      ggplot2::aes(xmin = start, xmax = end, y = molecule, id = gene),
      on = "genE",
      side = "right"
    )
    ggplot2::ggplot(
      example_genes,
      ggplot2::aes(xmin = start, xmax = end, y = molecule, fill = gene)
      ) +
      geom_gene_arrow() +
      ggplot2::geom_blank(data = dummies) +
      ggplot2::facet_wrap(~ molecule, scales = "free", ncol = 1)
  } )
} )
