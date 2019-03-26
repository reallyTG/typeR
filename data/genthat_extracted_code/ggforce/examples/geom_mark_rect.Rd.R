library(ggforce)


### Name: geom_mark_rect
### Title: Annotate areas with rectangles
### Aliases: geom_mark_rect

### ** Examples

ggplot(iris, aes(Petal.Length, Petal.Width)) +
  geom_mark_rect(aes(fill = Species, filter = Species != 'versicolor')) +
  geom_point()

# Add annotation
ggplot(iris, aes(Petal.Length, Petal.Width)) +
  geom_mark_rect(aes(fill = Species, label = Species)) +
  geom_point()

# Long descriptions are automatically wrapped to fit into the width
iris$desc <- c(
  'A super Iris - and it knows it',
  'Pretty mediocre Iris, but give it a couple of years and it might surprise you',
  "You'll never guess what this Iris does every Sunday"
)[iris$Species]

ggplot(iris, aes(Petal.Length, Petal.Width)) +
  geom_mark_rect(aes(fill = Species, label = Species, description = desc,
                     filter = Species == 'setosa')) +
  geom_point()

# Change the buffer size to move labels farther away (or closer) from the
# marks
ggplot(iris, aes(Petal.Length, Petal.Width)) +
  geom_mark_rect(aes(fill = Species, label = Species),
                 label.buffer = unit(30, 'mm')) +
  geom_point()

# The connector is capped a bit before it reaches the mark, but this can be
# controlled
ggplot(iris, aes(Petal.Length, Petal.Width)) +
  geom_mark_rect(aes(fill = Species, label = Species),
                 con.cap = 0) +
  geom_point()



