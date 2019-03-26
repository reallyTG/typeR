library(broom)


### Name: tidy.lmodel2
### Title: Tidy a(n) lmodel2 object
### Aliases: tidy.lmodel2 lmodel2_tidiers

### ** Examples


if (require("lmodel2", quietly = TRUE)) {

  library(lmodel2)
  
  data(mod2ex2)
  Ex2.res <- lmodel2(Prey ~ Predators, data=mod2ex2, "relative", "relative", 99)
  Ex2.res

  tidy(Ex2.res)
  glance(Ex2.res)

  # this allows coefficient plots with ggplot2
  library(ggplot2)
  ggplot(tidy(Ex2.res), aes(estimate, term, color = method)) +
    geom_point() +
    geom_errorbarh(aes(xmin = conf.low, xmax = conf.high)) +
    geom_errorbarh(aes(xmin = conf.low, xmax = conf.high))
}




