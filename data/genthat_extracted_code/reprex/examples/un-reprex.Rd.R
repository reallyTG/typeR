library(reprex)


### Name: un-reprex
### Title: Un-render a reprex
### Aliases: un-reprex reprex_invert reprex_clean reprex_rescue

### ** Examples

## a rendered reprex can be inverted, at least approximately
x <- reprex({
  #' Some text
  #+ chunk-label-and-options-cannot-be-recovered, message = TRUE
  (x <- 1:4)
  #' More text
  y <- 2:5
  x + y
}, show = FALSE)
writeLines(x)
reprex_invert(x)
## a displayed reprex can be cleaned of commented output
x <- c(
  "## a regular comment, which is retained",
  "(x <- 1:4)",
  "#> [1] 1 2 3 4",
  "median(x)",
  "#> [1] 2.5"
  )
reprex_clean(x)

## Not run: 
##D ## round trip with reprex(..., venue = "R")
##D code_in <- c("x <- rnorm(2)", "min(x)")
##D res <- reprex(input = code_in, venue = "R")
##D res
##D (code_out <- reprex_clean(res))
##D identical(code_in, code_out)
## End(Not run)
## rescue a reprex that was copied from a live R session
x <- c(
  "> ## a regular comment, which is retained",
  "> (x <- 1:4)",
  "[1] 1 2 3 4",
  "> median(x)",
  "[1] 2.5"
)
reprex_rescue(x)



