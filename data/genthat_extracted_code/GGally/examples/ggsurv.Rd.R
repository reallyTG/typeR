library(GGally)


### Name: ggsurv
### Title: Survival curves with ggplot2
### Aliases: ggsurv

### ** Examples


if (require(survival) && require(scales)) {
  data(lung, package = "survival")
  sf.lung <- survival::survfit(Surv(time, status) ~ 1, data = lung)
  ggsurv(sf.lung)

  # Multiple strata examples
  sf.sex <- survival::survfit(Surv(time, status) ~ sex, data = lung)
  pl.sex <- ggsurv(sf.sex)
  pl.sex

  # Adjusting the legend of the ggsurv fit
  pl.sex +
    ggplot2::guides(linetype = FALSE) +
    ggplot2::scale_colour_discrete(
      name   = 'Sex',
      breaks = c(1,2),
      labels = c('Male', 'Female')
    )

  # We can still adjust the plot after fitting
  data(kidney, package = "survival")
  sf.kid <- survival::survfit(Surv(time, status) ~ disease, data = kidney)
  pl.kid <- ggsurv(sf.kid, plot.cens = FALSE)
  pl.kid

  # Zoom in to first 80 days
  pl.kid + ggplot2::coord_cartesian(xlim = c(0, 80), ylim = c(0.45, 1))

  # Add the diseases names to the plot and remove legend
  pl.kid +
    ggplot2::annotate(
      "text",
      label  = c("PKD", "Other", "GN", "AN"),
      x      = c(90, 125, 5, 60),
      y      = c(0.8, 0.65, 0.55, 0.30),
      size   = 5,
      colour = scales::hue_pal(
        h         = c(0, 360) + 15,
        c         = 100,
        l         = 65,
        h.start   = 0,
        direction = 1
      )(4)
    ) +
    ggplot2::guides(color = FALSE, linetype = FALSE)
}



