library(purrr)


### Name: negate
### Title: Negate a predicate function.
### Aliases: negate

### ** Examples

negate("x")
negate(is.null)
negate(~ .x > 0)

x <- transpose(list(x = 1:10, y = rbernoulli(10)))
x %>% keep("y") %>% length()
x %>% keep(negate("y")) %>% length()
# Same as
x %>% discard("y") %>% length()



