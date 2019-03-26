library(dotwhisker)


### Name: add_brackets
### Title: Add Labelled Brackets to Group Predictors in a Dot-and-Whisker
###   Plot
### Aliases: add_brackets

### ** Examples

library(broom)
library(dplyr)
data(mtcars)
m1 <- lm(mpg ~ wt + cyl + disp, data = mtcars)
two_brackets <- list(c("Engine", "Cylinder", "Displacement"),
                     c("Not Engine", "Intercept", "Weight"))

{dwplot(m1, show_intercept = TRUE) %>%
       relabel_predictors("(Intercept)" = "Intercept",
                          wt = "Weight",
                          cyl = "Cylinder",
                          disp = "Displacement") +
       theme_bw() + xlab("Coefficient") + ylab("") +
       theme(legend.position="none") +
       geom_vline(xintercept = 0, colour = "grey50", linetype = 2)} %>%
   add_brackets(two_brackets)




