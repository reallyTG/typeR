library(spef)


### Name: skiTum
### Title: A Simulated Data Mimicking a Skin Cancer Chemoprevention Trial
### Aliases: skiTum

### ** Examples

data(skiTum)
library(ggplot2)
skiTum$dfmo <- factor(skiTum$dfmo, levels = c(1, 0), labels = c("placebo", "DFMO"))
ggplot(skiTum, aes(time, id, height = 2, width = 25)) +
    geom_tile(aes(fill = count)) + theme_bw() +
    facet_grid(dfmo ~ ., scales = "free_y") +
    scale_fill_gradient(low = "grey", high = "black") + labs(fill="Count") +
    scale_x_continuous(breaks = seq(0, 1800, 100)) + xlab("Time in days")



