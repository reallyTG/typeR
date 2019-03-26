library(ggpubr)


### Name: add_summary
### Title: Add Summary Statistics onto a ggplot.
### Aliases: add_summary mean_se_ mean_sd mean_ci mean_range median_iqr
###   median_mad median_range

### ** Examples


# Basic violin plot
p <- ggviolin(ToothGrowth, x = "dose", y = "len", add = "none")
p

# Add median_iqr
add_summary(p, "mean_sd")





