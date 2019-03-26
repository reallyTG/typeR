library(tatoo)


### Name: flip_names
### Title: Flip names and multinames of a Composite Table
### Aliases: flip_names

### ** Examples


dat <- comp_table(
  cars1 = head(cars),
  cars2 = tail(cars),
  data.frame(id = LETTERS[1:6])
)

flip_names(dat)
flip_names(dat, id_vars = "id")
flip_names(dat, id_vars = c("id", "speed.cars1"))




