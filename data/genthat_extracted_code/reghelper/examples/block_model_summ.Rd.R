library(reghelper)


### Name: summary.block_lm
### Title: Summary functions for build_model block regression models.
### Aliases: summary.block_lm print.block_lm_summary coef.block_lm
###   residuals.block_lm fitted.block_lm summary.block_aov
###   print.block_aov_summary coef.block_aov residuals.block_aov
###   fitted.block_aov summary.block_glm print.block_glm_summary
###   coef.block_glm residuals.block_glm fitted.block_glm block_model_summ

### ** Examples

# 2 blocks: Petal.Length; Petal.Length + Petal.Width
model1 <- build_model(Sepal.Length, Petal.Length, Petal.Width, data=iris, model='lm')
summary(model1)
coef(model1)  # returns coefficients from both blocks 1 and 2

# 2 blocks: Species; Species + Petal.Length + Petal.Width + Petal.Length:Petal.Width
model2 <- build_model(Sepal.Length, Species, c(Petal.Length * Petal.Width), data=iris, model='lm')
summary(model2)
coef(model2, num=2)  # returns coefficients from second block only



