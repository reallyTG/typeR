## ---- message=FALSE, warning=FALSE---------------------------------------
library(lans2r)
library(dplyr)
library(knitr)
library(ggplot2)

## ------------------------------------------------------------------------
hmr <- load_HMR(system.file("extdata", "nanosims_data", "hmr", package = "lans2r"), 
                prefix = "", suffix = ".hmr_txt")

## ------------------------------------------------------------------------
hmr %>% select(-step, -voltage, -cts) %>% distinct() %>% kable()

## ---- fig.width = 7, fig.height = 5--------------------------------------
hmr %>% 
  ggplot() +
  aes(voltage, cts, color = ion) + 
  geom_line() +
  scale_y_log10("counts") +
  facet_wrap(~ion, scales = "free")

