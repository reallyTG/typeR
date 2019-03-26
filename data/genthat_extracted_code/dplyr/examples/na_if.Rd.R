library(dplyr)


### Name: na_if
### Title: Convert values to NA
### Aliases: na_if

### ** Examples

na_if(1:5, 5:1)

x <- c(1, -1, 0, 10)
100 / x
100 / na_if(x, 0)

y <- c("abc", "def", "", "ghi")
na_if(y, "")

# na_if is particularly useful inside mutate,
# and is meant for use with vectors rather than entire data frames
starwars %>%
  select(name, eye_color) %>%
  mutate(eye_color = na_if(eye_color, "unknown"))

# na_if can also be used with scoped variants of mutate
# like mutate_if to mutate multiple columns
starwars %>%
  mutate_if(is.character, list(~na_if(., "unknown")))



