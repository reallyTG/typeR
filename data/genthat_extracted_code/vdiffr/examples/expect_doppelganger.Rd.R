library(vdiffr)


### Name: expect_doppelganger
### Title: Does a figure look like its expected output?
### Aliases: expect_doppelganger

### ** Examples

if (FALSE) {  # Not run

library("ggplot2")

test_that("plots have known output", {
  disp_hist_base <- function() hist(mtcars$disp)
  expect_doppelganger("disp-histogram-base", disp_hist_base)

  disp_hist_ggplot <- ggplot(mtcars, aes(disp)) + geom_histogram()
  expect_doppelganger("disp-histogram-ggplot", disp_hist_ggplot)
})

}



