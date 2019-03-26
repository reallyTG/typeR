library(frite)


### Name: is.output.same
### Title: Checks if functions will produce identical output
### Aliases: is.output.same

### ** Examples


is.output.same(purrr::map(1:3, cumsum), lapply) # TRUE
is.output.same(cumsum(1:3), cumprod)     # FALSE
is.output.same(sum(1:3), prod)           # FALSE for outputs of different class
is.output.same(mean(1:3), prod)          # FALSE




