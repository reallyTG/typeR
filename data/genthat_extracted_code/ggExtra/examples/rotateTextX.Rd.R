library(ggExtra)


### Name: rotateTextX
### Title: Rotate x axis labels
### Aliases: rotateTextX

### ** Examples

df <- data.frame(x = paste("Letter", LETTERS, sep = "_"),
                 y = seq_along(LETTERS))
p <- ggplot2::ggplot(df, ggplot2::aes(x, y)) + ggplot2::geom_point()
p + rotateTextX()



