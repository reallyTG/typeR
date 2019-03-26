library(purrr)


### Name: detect
### Title: Find the value or position of the first match
### Aliases: detect detect_index

### ** Examples

is_even <- function(x) x %% 2 == 0

3:10 %>% detect(is_even)
3:10 %>% detect_index(is_even)

3:10 %>% detect(is_even, .right = TRUE)
3:10 %>% detect_index(is_even, .right = TRUE)


# Since `.f` is passed to as_mapper(), you can supply a
# lambda-formula or a pluck object:
x <- list(
  list(1, foo = FALSE),
  list(2, foo = TRUE),
  list(3, foo = TRUE)
)

detect(x, "foo")
detect_index(x, "foo")


# If you need to find all values, use keep():
keep(x, "foo")

# If you need to find all positions, use map_lgl():
which(map_lgl(x, "foo"))



