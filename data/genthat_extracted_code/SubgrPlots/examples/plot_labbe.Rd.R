library(SubgrPlots)


### Name: plot_labbe
### Title: L'Abbe plot for subgroup effect size
### Aliases: plot_labbe

### ** Examples

library(dplyr)

# Load the data to be used
data(prca)
dat <- prca
dat %>%
  mutate(bm = factor(ifelse(bm == 0 , "No", "Yes")),
         hx = factor(ifelse(hx == 0 , "No", "Yes")))-> dat

## 8. Labbe Plot -----------------------------------------------------------
lab.xy = list("Control Group Estimate", "Treatment Group Estimate")
plot_labbe(dat = dat,
           covari.sel = c(4,5,6,7),
           trt.sel = 3,
           resp.sel = c(1,2),
           outcome.type = "survival",
           effect = "RMST",
           lab.xy = lab.xy,
           size.shape = 0.2,
           adj.ann.subgrp = 1/30,
           time=50, show.ci = FALSE)




