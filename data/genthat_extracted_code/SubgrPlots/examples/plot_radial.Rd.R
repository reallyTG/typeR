library(SubgrPlots)


### Name: plot_radial
### Title: Radial (Galbraith) plot for subgroup effect size
### Aliases: plot_radial

### ** Examples

library(dplyr)

# Load the data to be used
data(prca)
dat <- prca
dat %>%
  mutate(bm = factor(ifelse(bm == 0 , "No", "Yes")),
         hx = factor(ifelse(hx == 0 , "No", "Yes")))-> dat

label.xy = list(expression(1/hat(sigma)[hat(delta)[i]]),
                expression((hat(delta)[i]-hat(delta)[F])/hat(sigma)[hat(delta)[i]]))
plot_radial(dat,
            covari.sel = c(4, 5, 6, 7),
            trt.sel = 3,
            resp.sel = c(1, 2),
            outcome.type = "survival",
            range.v = c(-7, 6),
            adj.ann.subgrp = 4,
            font.size = c(1, 1, 0.75, 0.8, 0.85),
            lab.xy = label.xy)



