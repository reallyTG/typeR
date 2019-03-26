library(observer)


### Name: observe_if
### Title: Observe your data
### Aliases: observe observe.default observe_if observe_if_
###   observe_if_.data.frame observe_if_.grouped_df observe_if_.tbl_df

### ** Examples

library(magrittr)

df <- data.frame(x = 1:3, y = 2:4)
df %>% 
  observe_if(y-x==1) %>% 
  observe_if(x < 3) %>% 
  observe_if(y < 4, x > 1) %>% 
  obs()




