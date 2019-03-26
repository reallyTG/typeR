library(SubgrPlots)


### Name: plot_radial2
### Title: Radial (Galbraith) plot for subgroup effect size
### Aliases: plot_radial2

### ** Examples

library(dplyr)

# Load the data to be used
data(prca)
dat <- prca
dat %>%
  mutate(bm = factor(ifelse(bm == 0 , "No", "Yes")),
         hx = factor(ifelse(hx == 0 , "No", "Yes")))-> dat

lab.x = expression(1/sqrt(hat(Var)(hat(delta)[i]-hat(delta)[F])))
lab.y = expression((hat(delta)[i]-hat(delta)[F])/sqrt(hat(Var)(hat(delta)[i]-hat(delta)[F])))
lab.xy = label.xy = list(lab.x, lab.y)
plot_radial2(dat,
             covari.sel = c(4, 5, 6, 7),
             trt.sel = 3,
             resp.sel = c(1, 2),
             outcome.type = "survival",
             range.v = c(-11, 8),
             adj.ann.subgrp = 4,
             font.size = c(1, 1, .6, .6, .6),
             lab.xy = label.xy)



