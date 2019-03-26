library(dbplyr)


### Name: window_order
### Title: Override window order and frame
### Aliases: window_order window_frame

### ** Examples

library(dplyr)
df <- lazy_frame(g = rep(1:2, each = 5), y = runif(10), z = 1:10)

df %>%
  window_order(y) %>%
  mutate(z = cumsum(y)) %>%
  sql_build()

df %>%
  group_by(g) %>%
  window_frame(-3, 0) %>%
  window_order(z) %>%
  mutate(z = sum(x)) %>%
  sql_build()



