library(healthcareai)


### Name: plot.interpret
### Title: Plot regularized model coefficients
### Aliases: plot.interpret

### ** Examples

machine_learn(mtcars, outcome = mpg, models = "glm", tune = FALSE) %>%
  interpret() %>%
  plot(font_size = 14)



