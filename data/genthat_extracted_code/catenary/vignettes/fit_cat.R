## ---- warning=FALSE, message=FALSE---------------------------------------
library(catenary)
library(tidyverse)

sim_data <- data_frame(x = runif(100,0,4))
sim_data  <- sim_data %>% 
  mutate(y = f(x, c1 = 1, c2 = 2, lambda = 3))
sim_data  <- sim_data %>% 
  mutate(y = y + rnorm(100,0,0.1))

sim_data %>% ggplot(aes(x,y)) + geom_point()

## ------------------------------------------------------------------------
sim_data_cat <- fittedCatenary(sim_data$x, sim_data$y)
plot(sim_data_cat,fit='cat', envelope='cat')
show(sim_data_cat)

## ------------------------------------------------------------------------
gof(sim_data_cat)

