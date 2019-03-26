library(ggfortify)


### Name: plot_confint
### Title: Attach confidence interval to 'ggplot2::ggplot'
### Aliases: plot_confint

### ** Examples

d <- fortify(stats::acf(AirPassengers, plot = FALSE))
p <- ggplot(data = d, mapping = aes(x = Lag))
ggfortify:::plot_confint(p, data = d)



