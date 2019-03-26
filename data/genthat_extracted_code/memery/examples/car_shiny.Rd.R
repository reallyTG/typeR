library(memery)


### Name: car_shiny
### Title: The ca(R) Shiny promotional meme
### Aliases: car_shiny

### ** Examples

library(ggplot2)
file <- "memery-car-shiny.gif" # outfile
set.seed(1)
p1 <- ggplot(data.frame(x = rbeta(100000, 10, 3)), aes(x)) +
  geom_histogram(colour = "white", fill = "#88888880", size = 1, bins = 30)

means <- (8:1)^3
sds <- 10*(8:1)
d <- data.frame(
  x = rep(factor(1:8), each = 100),
  y = unlist(purrr::map2(means, sds, ~rnorm(100, .x, .y) / 200))
)

p2 <- ggplot(d, aes(x, y)) +
  geom_boxplot(colour = "white", fill = "#5495CF80", outlier.colour = NA) +
  geom_point(shape = 21, colour = "white", fill = "#5495CF80", size = 1,
             position = position_jitter(0.15)) +
  scale_x_discrete(expand = c(0, 0.02)) + scale_y_continuous(expand = c(0.02, 0)) +
  theme_void() +
  theme(plot.margin = unit(rep(5, 4), "mm"),
        panel.grid.major = element_line(colour = "#FFFFFF50", linetype = 2),
        panel.grid.minor = element_line(colour = "#FFFFFF50", linetype = 2))

## Not run: car_shiny(file, p1, p2, test_frame = TRUE)



