library(huxtable)


### Name: by_cases
### Title: Map cell contents to properties using 'case_when'
### Aliases: by_cases

### ** Examples

if (! requireNamespace("dplyr")) {
  stop("Please install the 'dplyr' package to run this example")
}

ht <- hux(runif(5), letters[1:5])

map_background_color(ht, by_cases(
        . == "a" ~ "red",
        . %in% letters ~ "green",
        . < 0.5 ~ "pink"
      ))



