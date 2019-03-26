library(regrrr)


### Name: combine_long_tab
### Title: Combine regression results from different models by columns
### Aliases: combine_long_tab

### ** Examples

data(mtcars)
m1 <- lm(mpg ~ vs + carb + hp + wt + wt * hp , data = mtcars)
m2 <- update(m1, . ~ .+ wt * vs)
summary(m1)
summary(m2)
combine_long_tab(to_long_tab(summary(m1)$coef), 
                 to_long_tab(summary(m2)$coef))




