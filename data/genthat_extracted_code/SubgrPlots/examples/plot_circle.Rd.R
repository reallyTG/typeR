library(SubgrPlots)


### Name: plot_circle
### Title: Circular plot using circlize package
### Aliases: plot_circle

### ** Examples

library(dplyr)

# Load the data to be used
data(prca)
dat <- prca
vars = data.frame(variable = names(dat), index = 1:length(names(dat)))
levels(dat$age_group) = c("Young","Middle-aged","Old")
levels(dat$weight_group)  = c("Low","Mid","High")
dat %>%
  rename(Age= age_group,
         Weight = weight_group)-> dat

set.seed(55643)
plot_circle(dat,
            covari.sel = c(14, 15),
            trt.sel = 3,
            resp.sel = c(1, 2),
            outcome.type = "survival",
            range.v = NULL, adj.ann.subgrp = 4,
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




