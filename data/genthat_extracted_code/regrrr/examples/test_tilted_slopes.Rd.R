library(regrrr)


### Name: test_tilted_slopes
### Title: significance of regression slope (the marginal effect) under
###   moderation testing restriction: the sig. of beta_x under the
###   moderation of z1, with or without additional interaction terms, Aug
###   13th
### Aliases: test_tilted_slopes

### ** Examples

data(mtcars)
m1 <- lm(mpg ~ vs + carb + hp + wt + wt * hp , data = mtcars)
test_tilted_slopes(reg.coef = summary(m1)$coef, model = m1, 
                   x_var.name = "wt", moderator.name = "hp", data = mtcars)




