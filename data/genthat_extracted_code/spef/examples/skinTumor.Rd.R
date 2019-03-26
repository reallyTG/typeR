library(spef)


### Name: skinTumor
### Title: Skin cancer chemoprevention trial
### Aliases: skinTumor

### ** Examples

data(skinTumor)
library(ggplot2)
ggplot(skinTumor, aes(time, id, width = 25, height = 2)) +
    geom_tile(aes(fill = count)) + theme_bw() +
    facet_grid(dfmo ~ ., scales = "free_y", as.table = FALSE,
               labeller = labeller(dfmo = function(x) paste("DFMO =", x))) +
    scale_fill_gradient(low = "grey", high = "black") +
    scale_x_continuous(breaks = seq(0, 2000, 200)) +
    labs(fill = "Count") + xlab("Time in days")




