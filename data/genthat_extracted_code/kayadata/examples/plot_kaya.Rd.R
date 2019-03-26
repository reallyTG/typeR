library(kayadata)


### Name: plot_kaya
### Title: Plot Kaya-identity variable
### Aliases: plot_kaya

### ** Examples

china <- get_kaya_data("China")
plot_kaya(china, "F", 2001, 2011)
uk <- get_kaya_data("United Kingdom")
plot_kaya(uk, "e", log_scale = TRUE, trend_line = TRUE)
world <- get_kaya_data("World")
plot_kaya(world, "g", 1982, log_scale = TRUE, trend_line = TRUE)



