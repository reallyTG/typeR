context("vst function")

test_that('vst runs and returns expected output', {
  skip_on_cran()
  options(mc.cores = 2)
  set.seed(42)
  vst_out <- vst(pbmc, return_gene_attr = TRUE, return_cell_attr = TRUE)
  expect_equal(c(910, 283), dim(vst_out$y))
  ga <- vst_out$gene_attr[order(-vst_out$gene_attr$residual_variance), ]
  expect_equal(c("GNLY", "PPBP", "PF4", "GNG11", "SDPR"), rownames(ga)[1:5])
  expect_equal(c(14.47994, 12.90632, 12.35566, 11.25633, 10.10952), ga$residual_variance[1:5], tolerance = 1e-05)
})
