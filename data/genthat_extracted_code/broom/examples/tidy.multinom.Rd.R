library(broom)


### Name: tidy.multinom
### Title: Tidying methods for multinomial logistic regression models
### Aliases: tidy.multinom multinom_tidiers nnet_tidiers

### ** Examples


if (require(nnet) & require(MASS)){
  library(nnet)
  library(MASS)
  
  example(birthwt)
  bwt.mu <- multinom(low ~ ., bwt)
  tidy(bwt.mu)
  glance(bwt.mu)

  #* This model is a truly terrible model
  #* but it should show you what the output looks
  #* like in a multinomial logistic regression

  fit.gear <- multinom(gear ~ mpg + factor(am), data = mtcars)
  tidy(fit.gear)
  glance(fit.gear)
}




