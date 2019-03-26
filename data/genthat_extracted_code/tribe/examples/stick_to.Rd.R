library(tribe)


### Name: stick_to
### Title: Work on a specific attribute within a pipeline
### Aliases: stick_to stick_to_ unstick

### ** Examples

library(dplyr)
library(observer)

df <- ggplot2::diamonds %>% 
  mutate(depth2 = 100*2*z/(x+y)) %>% 
  observe_if(abs(depth-depth2) < 1)

observations(df)

df %>% 
  stick_to(observations) %@>% 
  mutate(Id = 2) %@>% 
  select(Id, Status) %>% 
  unstick()

observations(df)




