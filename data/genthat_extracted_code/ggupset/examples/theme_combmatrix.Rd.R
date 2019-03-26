library(ggupset)


### Name: theme_combmatrix
### Title: Theme for the combination matrix
### Aliases: theme_combmatrix

### ** Examples

library(ggplot2)
# Ensure that the y-axis label is next to the axis by setting
# combmatrix.label.make_space to FALSE
ggplot(tidy_movies[1:100, ], aes(x=Genres)) +
  geom_bar() +
  scale_x_upset() +
  theme_combmatrix(combmatrix.label.text = element_text(color = "black", size=15),
                   combmatrix.label.make_space = FALSE,
                   plot.margin = unit(c(1.5, 1.5, 1.5, 65), "pt"))

 # Change the color of the background stripes
 ggplot(tidy_movies[1:100, ], aes(x=Genres)) +
   geom_bar() +
   scale_x_upset() +
   theme_combmatrix(combmatrix.panel.striped_background = TRUE,
                    combmatrix.panel.striped_background.color.one = "grey")




