library(taber)


### Name: scion
### Title: scion
### Aliases: scion

### ** Examples

library(dplyr)
aframe <- data.frame(zed = runif(100))
set_to_zero <- . %>% mutate(zed = 0)
aframe %>% scion(zed >0.5, false_fun=set_to_zero) %>% mutate(zed=1) %>% graft



