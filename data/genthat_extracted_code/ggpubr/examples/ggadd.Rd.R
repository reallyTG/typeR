library(ggpubr)


### Name: ggadd
### Title: Add Summary Statistics or a Geom onto a ggplot
### Aliases: ggadd

### ** Examples

# Basic violin plot
data("ToothGrowth")
p <- ggviolin(ToothGrowth, x = "dose", y = "len", add = "none")

# Add mean +/- SD and jitter points
p %>% ggadd(c("mean_sd", "jitter"), color = "dose")

# Add box plot
p %>% ggadd(c("boxplot", "jitter"), color = "dose")




