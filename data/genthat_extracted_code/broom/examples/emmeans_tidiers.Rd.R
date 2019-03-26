library(broom)


### Name: emmeans_tidiers
### Title: Tidy estimated marginal means (least-squares means) objects from
###   the emmeans and lsmeans packages
### Aliases: emmeans_tidiers tidy.lsmobj tidy.ref.grid tidy.emmGrid

### ** Examples


if (require("emmeans", quietly = TRUE)) {
  # linear model for sales of oranges per day
  oranges_lm1 <- lm(sales1 ~ price1 + price2 + day + store, data = oranges)

  # reference grid; see vignette("basics", package = "emmeans")
  oranges_rg1 <- ref_grid(oranges_lm1)
  td <- tidy(oranges_rg1)
  td

  # marginal averages
  marginal <- emmeans(oranges_rg1, "day")
  tidy(marginal)

  # contrasts
  tidy(contrast(marginal))
  tidy(contrast(marginal, method = "pairwise"))

  # plot confidence intervals
  library(ggplot2)
  ggplot(tidy(marginal), aes(day, estimate)) +
    geom_point() +
    geom_errorbar(aes(ymin = conf.low, ymax = conf.high))

  # by multiple prices
  by_price <- emmeans(oranges_lm1, "day", by = "price2",
                      at = list(price1 = 50, price2 = c(40, 60, 80),
                      day = c("2", "3", "4")) )
  by_price
  tidy(by_price)

  ggplot(tidy(by_price), aes(price2, estimate, color = day)) +
    geom_line() +
    geom_errorbar(aes(ymin = conf.low, ymax = conf.high))
}




