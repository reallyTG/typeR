library(furrr)


### Name: future_invoke_map
### Title: Invoke functions via futures
### Aliases: future_invoke_map future_invoke_map_chr future_invoke_map_dbl
###   future_invoke_map_int future_invoke_map_lgl future_invoke_map_dfr
###   future_invoke_map_dfc

### ** Examples


## No test: 
plan(multiprocess)
## End(No test)

df <- dplyr::tibble(
  f = c("runif", "rpois", "rnorm"),
  params = list(
    list(n = 10),
    list(n = 5, lambda = 10),
    list(n = 10, mean = -3, sd = 10)
  )
)

future_invoke_map(df$f, df$params)





