library(bench)


### Name: autoplot.bench_mark
### Title: Autoplot method for bench_mark objects
### Aliases: autoplot.bench_mark plot.bench_mark

### ** Examples

dat <- data.frame(x = runif(10000, 1, 1000), y=runif(10000, 1, 1000))

res <- bench::mark(
  dat[dat$x > 500, ],
  dat[which(dat$x > 500), ],
  subset(dat, x > 500))

if (require(ggplot2)) {

  # Beeswarm plot
  autoplot(res)

  # ridge (joyplot)
  autoplot(res, "ridge")

  # If you want to have the plots ordered by execution time you can do so by
  # ordering factor levels in the expressions.
  if (require(dplyr) && require(forcats)) {

    res %>%
      mutate(expression = forcats::fct_reorder(expression, min, .desc = TRUE)) %>%
      as_bench_mark() %>%
      autoplot("violin")
  }
}



