library(wrapr)


### Name: reduceexpand
### Title: Use function to reduce or expand arguments.
### Aliases: reduceexpand %|.% %.|%

### ** Examples


# basic examples
1:10 %.|% sum
1:10 %.|% base::sum
1:10 %.|% function(...) { sum(...) }

# simulate partial application of log(., base=2)
1:4 %.>% do.call(log, list(., base = 2))

# # simulate partial application with dplyr
# # can be used with dplyr/rlang as follows
# d <- data.frame(x=1, y=2, z=3)
# syms <- rlang::syms(c("x", "y"))
# d %.>% do.call(dplyr::select, c(list(.), syms))




