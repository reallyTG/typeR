library(dplyr)


### Name: rowwise
### Title: Group input by rows
### Aliases: rowwise

### ** Examples

df <- expand.grid(x = 1:3, y = 3:1)
df_done <- df %>% rowwise() %>% do(i = seq(.$x, .$y))
df_done
df_done %>% summarise(n = length(i))



