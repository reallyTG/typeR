## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- fig.height=6, fig.width=6------------------------------------------
library(survsup)
library(ggplot2)
library(survival)
library(dplyr)


fit <- survfit(Surv(time, status) ~ 1, data = lung)
plot_survfit(fit)

## ---- fig.height=6, fig.width=6------------------------------------------
lung %>%
  survfit(Surv(time, status) ~ 1, data = .) %>%
  plot_survfit()

## ---- fig.height=6, fig.width=6------------------------------------------
lung %>%
  survfit(Surv(time, status) ~ 1, data = .) %>%
  plot_survfit(cuminc = FALSE)

## ---- fig.height=6, fig.width=6------------------------------------------
lung %>%
  survfit(Surv(time, status) ~ sex, data = .) %>%
  plot_survfit(cuminc = FALSE)

## ---- fig.height=6, fig.width=6------------------------------------------
lung %>%
  survfit(Surv(time, status) ~ sex, data = .) %>%
  plot_survfit(cuminc = FALSE, ci = TRUE)

## ---- fig.height=6, fig.width=6------------------------------------------
lung %>%
  survfit(Surv(time, status) ~ sex, data = .) %>%
  plot_survfit(cuminc = FALSE, ci = TRUE) + # <--- NOTE!
  labs(x = "Time (days)", y = "Survival (%)")

## ---- fig.height=6, fig.width=6------------------------------------------
lung %>%
  survfit(Surv(time, status) ~ sex, data = .) %>%
  plot_survfit(cuminc = FALSE) %>%
  nar()

## ---- fig.height=6, fig.width=6------------------------------------------
lung %>%
  survfit(Surv(time, status) ~ sex, data = .) %>%
  plot_survfit(cuminc = FALSE) %>%
  nar(size = 3)

## ---- fig.height=6, fig.width=6------------------------------------------
colon %>%
  survfit(Surv(time, status) ~ rx, data = .) %>%
  plot_survfit() %>%
  nar() +
  scale_color_manual(values = c("darkorange", "steelblue", "darkred"))

## ---- fig.height=6, fig.width=6------------------------------------------
colon %>%
  survfit(Surv(time, status) ~ extent, data = .) %>%
  plot_survfit() %>%
  nar() %>%
  skislopes()

## ---- fig.height=6, fig.width=6------------------------------------------
colon %>%
  survfit(Surv(time, status) ~ extent, data = .) %>%
  plot_survfit() %>%
  nar() %>%
  skislopes(reverse = TRUE)

## ---- fig.height=6, fig.width=6------------------------------------------
colon %>%
  survfit(Surv(time, status) ~ extent, data = .) %>%
  plot_survfit() %>%
  nar() %>%
  cat4()

## ---- fig.height=6, fig.width=6------------------------------------------
colon %>%
  survfit(Surv(time, status) ~ extent, data = .) %>%
  plot_survfit() %>%
  nar() %>%
  hcl_rainbow()

## ---- fig.height=6, fig.width=6------------------------------------------
colon %>%
  survfit(Surv(time, status) ~ extent, data = .) %>%
  plot_survfit() %>%
  nar() %>%
  hcl_rainbow(reverse = TRUE)

## ---- fig.height=6, fig.width=6------------------------------------------
colon %>%
  survfit(Surv(time, status) ~ extent, data = .) %>%
  plot_survfit(lwd = 2)

## ---- fig.height=6, fig.width=6------------------------------------------
colon %>%
  survfit(Surv(time, status) ~ extent, data = .) %>%
  plot_survfit(lwd = 0.5)

## ---- fig.height=6, fig.width=6------------------------------------------
colon %>%
  survfit(Surv(time, status) ~ extent, data = .) %>%
  plot_survfit(legend.title = "Extent of disease")

## ---- fig.height=6, fig.width=6------------------------------------------
colon %>%
  survfit(Surv(time, status) ~ extent, data = .) %>%
  plot_survfit(ylim = c(0, 100)) %>%
  nar()

## ---- fig.height=6, fig.width=6------------------------------------------
colon %>%
  survfit(Surv(time, status) ~ extent, data = .) %>%
  plot_survfit(xmax = 2000) %>%
  nar()

## ---- fig.height=6, fig.width=6------------------------------------------
colon %>%
  survfit(Surv(time, status) ~ extent, data = .) %>%
  plot_survfit(xmax = 2000, xbreaks = c(0, 1000, 2000)) %>%
  nar()

## ---- fig.height=6, fig.width=6------------------------------------------
colon %>%
  survfit(Surv(time, status) ~ sex, data = .) %>%
  plot_survfit() %>%
  nar()

## ---- fig.height=6, fig.width=6------------------------------------------
colon %>%
  survfit(Surv(time, status) ~ sex, data = .) %>%
  plot_survfit() %>%
  nar(flip = TRUE)

## ---- fig.height=6, fig.width=6------------------------------------------
colon %>%
  survfit(Surv(time, status) ~ sex, data = .) %>%
  plot_survfit() %>%
  nar(size = 5, flip = TRUE)

## ---- fig.height=6, fig.width=6------------------------------------------
colon %>%
  survfit(Surv(time, status) ~ sex, data = .) %>%
  plot_survfit() %>%
  nar(size = 2, flip = TRUE)

## ---- fig.height=6, fig.width=6------------------------------------------
colon %>%
  survfit(Surv(time, status) ~ sex, data = .) %>%
  plot_survfit() %>%
  nar(y_offset = 0.1, flip = TRUE)

## ---- fig.height=6, fig.width=6------------------------------------------
colon %>%
  survfit(Surv(time, status) ~ sex, data = .) %>%
  plot_survfit() %>%
  nar(y_offset = 0.03, flip = TRUE)

## ---- fig.height=6, fig.width=6------------------------------------------
colon %>%
  survfit(Surv(time, status) ~ sex, data = .) %>%
  plot_survfit() %>%
  nar(separator = FALSE)

## ---- fig.height=6, fig.width=6------------------------------------------
colon %>%
  survfit(Surv(time, status) ~ sex, data = .) %>%
  plot_survfit() %>%
  nar(sep_color = "grey90", sep_lwd = 1.5)

## ------------------------------------------------------------------------
library(gridExtra)

## ---- fig.height=6, fig.width=10-----------------------------------------
p <- list(
  p1 = colon %>%
    survfit(Surv(time, status) ~ sex, data = .) %>%
    plot_survfit(ylim = c(0, 100)) %>%
    nar() +
    labs(tag = "A"),

  p2 = colon %>%
    survfit(Surv(time, status) ~ node4, data = .) %>%
    plot_survfit(ylim = c(0, 100)) %>%
    nar() +
    labs(tag = "B")
)

grid.arrange(grobs = p, ncol = 2)


## ---- fig.height=10, fig.width=9, out.width="90%"------------------------
# Store plots in a list
p <- list(
  p1 = colon %>%
    survfit(Surv(time, status) ~ 1, data = .) %>%
    plot_survfit(ylim = c(0, 100)) +
    labs(tag = "A"),

  p2 = colon %>%
    survfit(Surv(time, status) ~ rx, data = .) %>%
    plot_survfit(ylim = c(0, 100)) %>%
    nar(2, separator = FALSE) +
    labs(tag = "B"),

  p3 = colon %>%
    survfit(Surv(time, status) ~ extent, data = .) %>%
    plot_survfit(ylim = c(0, 100)) %>%
    nar(2, separator = FALSE) +
    labs(tag = "C"),

  p4 = colon %>%
    survfit(Surv(time, status) ~ sex, data = .) %>%
    plot_survfit(ylim = c(0, 100)) %>%
    nar(2, separator = FALSE) +
    labs(tag = "D"),

  p5 = colon %>%
    survfit(Surv(time, status) ~ node4, data = .) %>%
    plot_survfit(ylim = c(0, 100)) %>%
    nar(2, separator = FALSE) +
    labs(tag = "E"),

  p6 = colon %>%
    survfit(Surv(time, status) ~ surg, data = .) %>%
    plot_survfit(ylim = c(0, 100)) %>%
    nar(2, separator = FALSE) +
    labs(tag = "F")

)

#Define layout matrix
lay <- rbind(c(1,1,2),
             c(1,1,3),
             c(4,5,6))

#Plot it all!
grid.arrange(grobs = p, layout_matrix = lay)


## ---- fig.height=6, fig.width=6------------------------------------------
p[["p3"]]

