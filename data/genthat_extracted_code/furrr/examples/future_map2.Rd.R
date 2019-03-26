library(furrr)


### Name: future_map2
### Title: Map over multiple inputs simultaneously via futures
### Aliases: future_map2 future_map2_chr future_map2_dbl future_map2_int
###   future_map2_lgl future_map2_dfr future_map2_dfc future_pmap
###   future_pmap_chr future_pmap_dbl future_pmap_int future_pmap_lgl
###   future_pmap_dfr future_pmap_dfc

### ** Examples


library(furrr)
## No test: 
plan(multiprocess)
## End(No test)

x <- list(1, 10, 100)
y <- list(1, 2, 3)
z <- list(5, 50, 500)

future_map2(x, y, ~ .x + .y)

# Split into pieces, fit model to each piece, then predict
by_cyl <- split(mtcars, mtcars$cyl)
mods <- future_map(by_cyl, ~ lm(mpg ~ wt, data = .))
future_map2(mods, by_cyl, predict)

future_pmap(list(x, y, z), sum)

# Matching arguments by position
future_pmap(list(x, y, z), function(a, b ,c) a / (b + c))

# Vectorizing a function over multiple arguments
df <- data.frame(
  x = c("apple", "banana", "cherry"),
  pattern = c("p", "n", "h"),
  replacement = c("x", "f", "q"),
  stringsAsFactors = FALSE
)
future_pmap(df, gsub)
future_pmap_chr(df, gsub)




