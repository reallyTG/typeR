library(regrrr)


### Name: plot_effect
### Title: plotting the marginal effect of X on Y, with or without one or
###   multiple interaction terms
### Aliases: plot_effect

### ** Examples

data(mtcars)
m1 <- lm(mpg ~ vs + carb + hp + wt + wt * hp , data = mtcars)
plot_effect(reg.coef = summary(m1)$coefficients, 
                 data = mtcars, model = m1, 
                 x_var.name = "wt", y_var.name = "mpg", moderator.name = "hp", 
                 confidence_interval = TRUE,  CI_Ribbon = TRUE, 
                 xlab = "Weight", ylab = "MPG", moderator.lab = "Horsepower")

#' @examples
data(mtcars)
m2 <- lm(mpg ~ vs + carb + hp + wt + wt * hp + wt * vs, data = mtcars)
plot_effect(reg.coef = summary(m2)$coefficients, 
            data = mtcars, model = m2, 
            x_var.name = "wt", y_var.name = "mpg", moderator.name = "hp", 
            confidence_interval = TRUE,  CI_Ribbon = FALSE, 
            xlab = "Weight", ylab = "MPG", moderator.lab = "Horsepower")

## Not run: 
##D # this shows the function is compatible with ggplot2 customization
##D library(extrafont)
##D m1 <- lm(mpg ~ vs + carb + hp + wt + wt * hp , data = mtcars)
##D plot_effect(reg.coef = summary(m1)$coefficients, 
##D                  data = mtcars, model = m1, 
##D                  x_var.name = "wt", y_var.name = "mpg", moderator.name = "hp", 
##D                  confidence_interval = TRUE,  CI_Ribbon = TRUE, 
##D                  xlab = "Weight", ylab = "MPG", moderator.lab = "Horsepower") + 
##D ggplot2::theme(text=ggplot2::element_text(family="Times New Roman", size = 16))
## End(Not run)




