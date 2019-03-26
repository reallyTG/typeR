library(ggupset)


### Name: scale_x_upset
### Title: Scale to make UpSet plots
### Aliases: scale_x_upset

### ** Examples

library(ggplot2)
ggplot(tidy_movies[1:100, ], aes(x=Genres)) +
  geom_bar() +
  scale_x_upset(reverse = TRUE, sets=c("Drama", "Action"))

 ggplot(tidy_movies[1:100, ], aes(x=Genres)) +
   geom_bar() +
   scale_x_upset(n_intersections = 5, ytrans="sqrt")

 ggplot(tidy_movies[1:100, ], aes(x=Genres, y=year)) +
   geom_boxplot() +
   scale_x_upset(intersections = list(c("Drama", "Comedy"), c("Short"), c("Short", "Animation")),
                 sets = c("Drama", "Comedy", "Short", "Animation", "Horror"))



