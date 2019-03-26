library(etable)


### Name: corr_p_cell
### Title: Correlation Cell FUN
### Aliases: corr_p_cell
### Keywords: correlation

### ** Examples

sex     <- factor(rbinom(1000, 1, 0.4),  labels=c('Men', 'Women'))
height  <- rnorm(1000, mean=1.70, sd=0.1)
weight  <- rnorm(1000, mean=70, sd=5)
bmi     <- weight/height^2
d<-data.frame(sex, bmi, height, weight)
tabular.ade(x_vars=c('bmi','height','weight'), xname=c('BMI','Height','Weight'),
            y_vars=c('bmi','height','weight'), yname=c('BMI','Height','Weight'),
            rows=c('sex','ALL'), rnames=c('Gender'), data=d, FUN=corr_p_cell)



