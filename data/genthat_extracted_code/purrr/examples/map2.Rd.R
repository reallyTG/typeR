library(purrr)


### Name: map2
### Title: Map over multiple inputs simultaneously.
### Aliases: map2 map2_lgl map2_int map2_dbl map2_chr map2_raw map2_dfr
###   map2_dfc map2_df walk2 pmap pmap_lgl pmap_int pmap_dbl pmap_chr
###   pmap_raw pmap_dfr pmap_dfc pmap_df pwalk

### ** Examples

x <- list(1, 10, 100)
y <- list(1, 2, 3)
z <- list(5, 50, 500)

map2(x, y, ~ .x + .y)
# Or just
map2(x, y, `+`)

pmap(list(x, y, z), sum)

# Matching arguments by position
pmap(list(x, y, z), function(a, b, c) a / (b + c))

# Matching arguments by name
l <- list(a = x, b = y, c = z)
pmap(l, function(c, b, a) a / (b + c))

# Split into pieces, fit model to each piece, then predict
by_cyl <- mtcars %>% split(.$cyl)
mods <- by_cyl %>% map(~ lm(mpg ~ wt, data = .))
map2(mods, by_cyl, predict)

# Vectorizing a function over multiple arguments
df <- data.frame(
  x = c("apple", "banana", "cherry"),
  pattern = c("p", "n", "h"),
  replacement = c("x", "f", "q"),
  stringsAsFactors = FALSE
  )
pmap(df, gsub)
pmap_chr(df, gsub)

# Use `...` to absorb unused components of input list .l
df <- data.frame(
  x = 1:3 + 0.1,
  y = 3:1 - 0.1,
  z = letters[1:3]
)
plus <- function(x, y) x + y
## Not run: 
##D # this won't work
##D pmap(df, plus)
## End(Not run)
# but this will
plus2 <- function(x, y, ...) x + y
pmap_dbl(df, plus2)

# The "p" for "parallel" in pmap() is the same as in base::pmin()
# and base::pmax()
df <- data.frame(
  x = c(1, 2, 5),
  y = c(5, 4, 8)
)
# all produce the same result
pmin(df$x, df$y)
map2_dbl(df$x, df$y, min)
pmap_dbl(df, min)

# If you want to bind the results of your function rowwise, use map2_dfr() or pmap_dfr()
ex_fun <- function(arg1, arg2){
col <- arg1 + arg2
x <- as.data.frame(col)
}
arg1 <- seq(1, 10, by = 3)
arg2 <- seq(2, 11, by = 3)
df <- map2_dfr(arg1, arg2, ex_fun)
# If instead you want to bind by columns, use map2_dfc() or pmap_dfc()
df2 <- map2_dfc(arg1, arg2, ex_fun)



