library(dotwhisker)


### Name: by_2sd
### Title: Rescale regression results by multiplying by 2 standard
###   deviations
### Aliases: by_2sd

### ** Examples

library(broom)
library(dplyr)

data(mtcars)
m1 <- lm(mpg ~ wt + cyl + disp, data = mtcars)
m1_df <- tidy(m1) %>% by_2sd(mtcars) # create data frame of rescaled regression results




