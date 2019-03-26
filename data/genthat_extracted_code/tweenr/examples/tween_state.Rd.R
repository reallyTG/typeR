library(tweenr)


### Name: tween_state
### Title: Compose tweening between states
### Aliases: tween_state keep_state open_state close_state

### ** Examples

data1 <- data.frame(
  x = 1:20,
  y = 0,
  colour = 'forestgreen',
  stringsAsFactors = FALSE
)
data2 <- data1
data2$x <- 20:1
data2$y <- 1

data <- data1 %>%
  tween_state(data2, 'linear', 50) %>%
  keep_state(20) %>%
  tween_state(data1, 'bounce-out', 50)

# Using enter and exit (made up numbers)
df1 <- data.frame(
  country = c('Denmark', 'Sweden', 'Norway'),
  population = c(5e6, 10e6, 3.5e6)
)
df2 <- data.frame(
  country = c('Denmark', 'Sweden', 'Norway', 'Finland'),
  population = c(6e6, 10.5e6, 4e6, 3e6)
)
df3 <- data.frame(
  country = c('Denmark', 'Norway'),
  population = c(10e6, 6e6)
)
to_zero <- function(x) {
  x$population <- 0
  x
}
pop_devel <- df1 %>%
  tween_state(df2, 'cubic-in-out', 50, id = country, enter = to_zero) %>%
  tween_state(df3, 'cubic-in-out', 50, id = country, enter = to_zero,
              exit = to_zero)




