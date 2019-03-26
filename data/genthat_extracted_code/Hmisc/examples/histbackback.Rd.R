library(Hmisc)


### Name: histbackback
### Title: Back to Back Histograms
### Aliases: histbackback
### Keywords: dplot hplot distribution

### ** Examples

options(digits=3)
set.seed(1)
histbackback(rnorm(20), rnorm(30))


fool <- list(x=rnorm(40), y=rnorm(40))
histbackback(fool)
age <- rnorm(1000,50,10)
sex <- sample(c('female','male'),1000,TRUE)
histbackback(split(age, sex))
agef <- age[sex=='female']; agem <- age[sex=='male']
histbackback(list(Female=agef,Male=agem), probability=TRUE, xlim=c(-.06,.06))



