library(econullnetr)


### Name: plot_preferences
### Title: Plot the resource preferences of a consumer
### Aliases: plot_preferences

### ** Examples

null.1 <- generate_null_net(WelshStreams[, 2:18], WelshStreams.prey[, 2:17],
                            sims = 10, c.samples = WelshStreams[, 1],
                            r.samples = WelshStreams.prey[, 1])
# Basic plots, showing the dot and bar plot styles. Increased lower margin
#   on the bar plot so that names fit
plot_preferences(null.1, "Dinocras", signif.level = 0.95, type = "counts",
                 xlab = "Num. of visits", p.cex = 1.2, lwd = 2)

par(mar = c(9, 4, 4, 2) + 0.1)
plot_preferences(null.1, "Dinocras", style = "bars", signif.level = 0.95,
                 type = "counts", ylab = "Num. of visits")

# Same results, this time showing the standardised effect sizes
plot_preferences(null.1, "Rhyacophila", signif.level = 0.95,
                 type = "SES", xlab = "SES")
par(mar = c(9, 4, 4, 2) + 0.1)
plot_preferences(null.1, "Rhyacophila", signif.level = 0.95, style = "bars",
                 type = "SES", ylab = "SES")




