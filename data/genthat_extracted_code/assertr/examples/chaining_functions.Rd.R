library(assertr)


### Name: chaining_functions
### Title: Chaining functions
### Aliases: chaining_functions chain_start chain_end

### ** Examples

library(magrittr)

mtcars %>%
  chain_start() %>%
  verify(nrow(mtcars) > 10) %>%
  verify(mpg > 0) %>%
  insist(within_n_sds(4), mpg) %>%
  assert(in_set(0,1), am, vs) %>%
  chain_end()



