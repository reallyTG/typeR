library(statar)


### Name: tab
### Title: Returns cross tabulation
### Aliases: tab

### ** Examples

# setup
library(dplyr)
N <- 1e2 ; K = 10
df <- data_frame(
  id = sample(c(NA,1:5), N/K, TRUE),
  v1 =  sample(1:5, N/K, TRUE)                       
)
# one-way tabulation
df %>% tab(id)
df %>% tab(id, wt = v1)
# two-way tabulation
df %>% tab(id, v1)
df %>% filter(id >= 3) %>% tab(id)



