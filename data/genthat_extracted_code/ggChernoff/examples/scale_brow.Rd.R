library(ggChernoff)


### Name: scale_brow_continuous
### Title: Scales for angry eyebrows
### Aliases: scale_brow_continuous scale_brow

### ** Examples

library(ggplot2)
p <- ggplot(iris) +
    aes(Sepal.Width, Sepal.Length, fill = Species, brow = Sepal.Length) +
    geom_chernoff()
p
p + scale_brow_continuous(midpoint = min)
p + scale_brow_continuous(range = c(-.5, 2))

# Only show eyebrows if 'sad', otherwise hide them
usa <- data.frame(date = c(time(presidents)), rating = c(presidents))
ggplot(subset(usa, complete.cases(usa))) +
    aes(date, rating, smile = rating, fill = rating,
        brow = ifelse(rating < 50, rating, NA)) +
    geom_line() +
    geom_chernoff(show.legend = FALSE) +
    scale_brow(range = -1:0) +
    scale_fill_gradient(low = 'skyblue1', high = 'goldenrod1')





