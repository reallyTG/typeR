context("colors_symbols")

test_that("Can generate plots with colors", {
  for (ix in sample(1:100, 20)) {
    expect_silent(plot(1:10, 1:10, col = my.colors(ix)))
    dev.off()
  }
})

test_that("Can generate plots with colors", {
  for (ix in sample(1:100, 20)) {
    expect_silent(plot(1:10, 1:10, pch = my.symbols(ix)))
    dev.off()
  }
})
