library(dotwhisker)


### Name: relabel_predictors
### Title: Relabel the Predictors in a Tidy Data Frame of Regression
###   Results
### Aliases: relabel_predictors

### ** Examples

library(broom)
library(dplyr)

data(mtcars)
m1 <- lm(mpg ~ wt + cyl + disp, data = mtcars)
m1_df <- broom::tidy(m1) %>%
         relabel_predictors("(Intercept)" = "Intercept",
                              wt = "Weight",
                              disp = "Displacement",
                              cyl = "Cylinder")
dwplot(m1_df)

dwplot(m1, show_intercept = TRUE) %>%
    relabel_predictors("(Intercept)" = "Intercept",
                              wt = "Weight",
                              disp = "Displacement",
                              cyl = "Cylinder")





