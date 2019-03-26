library(tibble)


### Name: name-repair
### Title: Repair the names of a vector
### Aliases: name-repair

### ** Examples

## Not run: 
##D ## by default, duplicate names are not allowed
##D tibble(x = 1, x = 2)
## End(Not run)
## you can authorize duplicate names
tibble(x = 1, x = 2, .name_repair = "minimal")
## or request that the names be made unique
tibble(x = 1, x = 2, .name_repair = "unique")

## by default, non-syntactic names are allowed
df <- tibble(`a 1` = 1, `a 2` = 2)
## because you can still index by name
df[["a 1"]]
df$`a 1`

## syntactic names are easier to work with, though, and you can request them
df <- tibble(`a 1` = 1, `a 2` = 2, .name_repair = "universal")
df$a.1

## you can specify your own name repair function
tibble(x = 1, x = 2, .name_repair = make.unique)

fix_names <- function(x) gsub("%", " percent", x)
tibble(`25%` = 1, `75%` = 2, .name_repair = fix_names)

fix_names <- function(x) gsub("\\s+", "_", x)
tibble(`year 1` = 1, `year 2` = 2, .name_repair = fix_names)

## purrr-style anonymous functions and constants
## are also supported
tibble(x = 1, x = 2, .name_repair = ~ make.names(., unique = TRUE))

tibble(x = 1, x = 2, .name_repair = ~ c("a", "b"))

## the names attibute will be non-NULL, with "" as the default element
df <- as_tibble(list(1:3, letters[1:3]), .name_repair = "minimal")
names(df)



