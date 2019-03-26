context("Generics")

test_that("print summaries mandelbrot objects", {
  mb <- mandelbrot()
  expect_output(print(mb), "Mandelbrot")
  expect_output(print(mb), nrow(mb))
})
