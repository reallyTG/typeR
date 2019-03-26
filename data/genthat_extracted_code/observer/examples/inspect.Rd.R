library(observer)


### Name: inspect
### Title: Inspect observations
### Aliases: inspect

### ** Examples

library(magrittr)

df <- data.frame(id = c("a", "b", "c"), x = 1:3, y = 2:4, z = c(1.1, 10, 5))
df <- df %>% 
  observe_if(z==floor(z), 
             y-x==1, 
             x < 3) %>% 
  observe_if(y < 4, 
             x > 1)
  
print(obs(df))

df1 <- df %>%  
  inspect(ob = 5, cols="most")
print(obs(df1))




