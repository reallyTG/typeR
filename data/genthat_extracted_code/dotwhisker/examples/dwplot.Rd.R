library(dotwhisker)


### Name: dwplot
### Title: Dot-and-Whisker Plots of Regression Results
### Aliases: dwplot dw_plot

### ** Examples

library(broom)
library(dplyr)
# Plot regression coefficients from a single model object
data(mtcars)
m1 <- lm(mpg ~ wt + cyl + disp, data = mtcars)
dwplot(m1, vline = geom_vline(xintercept = 0, colour = "grey50", linetype = 2)) +
    xlab("Coefficient")
# using 99% confidence interval
dwplot(m1, conf.level = .99)
# Plot regression coefficients from multiple models
m2 <- update(m1, . ~ . - disp)
dwplot(list(full = m1, nodisp = m2))
# Change the appearance of dots and whiskers
dwplot(m1, dot_args = list(size = 3, pch = 21, fill = "white"))
# Plot regression coefficients from multiple models on the fly
mtcars %>%
    split(.$am) %>%
    purrr::map(~ lm(mpg ~ wt + cyl + disp, data = .x)) %>%
    dwplot() %>%
    relabel_predictors(c(wt = "Weight", cyl = "Cylinders", disp = "Displacement")) +
    theme_bw() + xlab("Coefficient") + ylab("") +
    geom_vline(xintercept = 0, colour = "grey60", linetype = 2) +
    ggtitle("Predicting Gas Mileage, OLS Estimates") +
    theme(plot.title = element_text(face = "bold"),
          legend.position = c(.995, .99),
          legend.justification = c(1, 1),
          legend.background = element_rect(colour="grey80"),
          legend.title.align = .5) +
    scale_colour_grey(start = .4, end = .8,
                      name = "Transmission",
                      breaks = c("Model 0", "Model 1"),
                      labels = c("Automatic", "Manual"))




