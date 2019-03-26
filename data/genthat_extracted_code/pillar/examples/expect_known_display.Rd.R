library(pillar)


### Name: expect_known_display
### Title: Test helpers
### Aliases: expect_known_display

### ** Examples

file <- tempfile("pillar", fileext = ".txt")

# The pillar is constructed after options have been set
# (need two runs because reference file doesn't exist during the first run)
suppressWarnings(tryCatch(
  expect_known_display(pillar(1:3), file, crayon = FALSE),
  expectation_failure = function(e) {}
))
expect_known_display(pillar(1:3), file, crayon = FALSE)

# Good: Use tidyeval to defer construction
pillar_quo <- rlang::quo(pillar(1:3))
expect_known_display(!!pillar_quo, file, crayon = FALSE)

## Not run: 
##D # Bad: Options set in the active session may affect the display
##D integer_pillar <- pillar(1:3)
##D expect_known_display(integer_pillar, file, crayon = FALSE)
## End(Not run)



