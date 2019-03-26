library(etable)


### Name: combi_cell
### Title: Dichotomous and continuous variables combination Cell FUN
### Aliases: combi_cell
### Keywords: mean median

### ** Examples

sex     <- factor(rbinom(1000, 1, 0.4),  labels=c('Men', 'Women'))
height  <- rnorm(1000, mean=1.7, sd=0.1)
weight  <- rnorm(1000, mean=70, sd=5)
bmi     <- weight/height^2
event   <- factor(rbinom(1000, 1, 0.1), labels=c('no',  'yes'))
d<-data.frame(sex, height, weight, bmi, event)
tabular.ade(x_vars=names(d), cols=c('sex','ALL'), rnames=c('Gender'),
            data=d, FUN=combi_cell)



