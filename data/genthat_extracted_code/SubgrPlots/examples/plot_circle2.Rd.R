library(SubgrPlots)


### Name: plot_circle2
### Title: Circular plot using circlize package with matrix layout.
### Aliases: plot_circle2

### ** Examples

# Load the data to be used
data(prca)
dat <- prca
set.seed(12)
plot_circle2(dat,
                   covari.sel = c(4, 5, 6, 7),
                   trt.sel = 3,
                   resp.sel = c(1,2),
                   outcome.type = "survival",
                   range.v = NULL,
                   adj.ann.subgrp = 4,
                   range.strip=c(-3, 3),
                   n.brk = 31,
                   n.brk.axis = 7,
                   font.size = c(1, 1, 0.85, 0.85, 1),
                   title = NULL, lab.xy = NULL,
                   strip = "Treatment effect size (log hazard ratio)",
                   effect = "HR",
                   equal.width = FALSE,
                   show.KM = FALSE,
                   show.effect = TRUE,
                   conf.int = FALSE, palette = "hcl")





