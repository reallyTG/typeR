library(ggvis)


### Name: dplyr-ggvis
### Title: Dplyr verbs for ggvis.
### Aliases: dplyr-ggvis groups.ggvis group_by_.ggvis ungroup.ggvis
###   summarise_.ggvis mutate_.ggvis arrange_.ggvis select_.ggvis
###   filter_.ggvis distinct_.ggvis slice_.ggvis rename_.ggvis
###   transmute_.ggvis groups.reactive ungroup.reactive group_by_.reactive
###   summarise_.reactive mutate_.reactive arrange_.reactive
###   select_.reactive filter_.reactive distinct_.reactive slice_.reactive
###   rename_.reactive transmute_.reactive
### Keywords: internal

### ** Examples

library(dplyr)
base <- mtcars %>% ggvis(~mpg, ~cyl) %>% layer_points()
base %>% group_by(cyl) %>% summarise(mpg = mean(mpg)) %>%
  layer_points(fill := "red", size := 100)

base %>% filter(mpg > 25) %>% layer_points(fill := "red")

base %>% mutate(cyl = jitter(cyl)) %>% layer_points(fill := "red")

## Not run: 
##D # Dynamically restrict range using filter
##D mtcars %>% ggvis(~disp, ~mpg) %>%
##D    filter(cyl > eval(input_slider(0, 10))) %>%
##D    layer_points()
##D 
##D # Dynamically compute box-cox transformation with mutate
##D bc <- function(x, lambda) {
##D   if (abs(lambda) < 1e-6) log(x) else (x ^ lambda - 1) / lambda
##D }
##D bc_slider <- input_slider(-2, 2, 1, step = 0.1)
##D mtcars %>%
##D  ggvis(~disp, ~mpg) %>%
##D  mutate(disp = bc(disp, eval(bc_slider))) %>%
##D  layer_points()
## End(Not run)



