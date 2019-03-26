library(glue)


### Name: glue
### Title: Format and interpolate a string
### Aliases: glue glue_data

### ** Examples

name <- "Fred"
age <- 50
anniversary <- as.Date("1991-10-12")
glue('My name is {name},',
  'my age next year is {age + 1},',
  'my anniversary is {format(anniversary, "%A, %B %d, %Y")}.')

# single braces can be inserted by doubling them
glue("My name is {name}, not {{name}}.")

# Named arguments can be used to assign temporary variables.
glue('My name is {name},',
  ' my age next year is {age + 1},',
  ' my anniversary is {format(anniversary, "%A, %B %d, %Y")}.',
  name = "Joe",
  age = 40,
  anniversary = as.Date("2001-10-12"))


# `glue_data()` is useful in magrittr pipes
library(magrittr)
mtcars %>% glue_data("{rownames(.)} has {hp} hp")

# Or within dplyr pipelines
library(dplyr)
head(iris) %>%
  mutate(description = glue("This {Species} has a petal length of {Petal.Length}"))

# Alternative delimiters can also be used if needed
one <- "1"
glue("The value of $e^{2\\pi i}$ is $<<one>>$.", .open = "<<", .close = ">>")



