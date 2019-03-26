library(tor)


### Name: list_any
### Title: Read multiple files into a list with your favorite reader
###   function.
### Aliases: list_any

### ** Examples

tor_example()

path <- tor_example("csv")
dir(path)

list_any(path, read.csv)

list_any(path, ~ read.csv(.x, stringsAsFactors = FALSE))

(path_mixed <- tor_example("mixed"))
dir(path_mixed)

list_any(
  path_mixed, ~ get(load(.x)),
  regexp = "[.]csv$",
  invert = TRUE
)

list_any(
  path_mixed, ~ get(load(.x)),
  "[.]Rdata$",
  ignore.case = TRUE
)



