context("plot")

test_that("ypr_plot_schedule", {
  gp <- ypr_plot_schedule(ypr_population())
  expect_is(gp, "gg")
})

test_that("ypr_plot_fish", {
  gp <- ypr_plot_fish(ypr_population(Rmax = 1000), y = "Caught", binwidth = 1L)
  expect_is(gp, "gg")
})

test_that("ypr_plot_yield", {
  gp <- ypr_plot_yield(ypr_population(Rk = 10), y = "YPUE",  pi = seq(0, 1, length.out = 10))
  expect_is(gp, "gg")
})

test_that("ypr_plot_yield", {
  gp <- ypr_plot_yield(ypr_populations(Rk = c(2.5, 4.6), Llo = c(0, 60)),
                 pi = seq(0, 1, length.out = 2), plot_values = FALSE) +
    ggplot2::facet_wrap(~Llo) +
    ggplot2::aes_string(group = "Rk", color = "Rk") +
    ggplot2::scale_color_manual(values = c("black", "blue"))

  expect_is(gp, "gg")
})


test_that("ypr_plot_sr", {
  gp <- ypr_plot_sr(ypr_population())
  expect_is(gp, "gg")
})
