library(psych)


### Name: income
### Title: US family income from US census 2008
### Aliases: income all.income
### Keywords: datasets

### ** Examples

data(income)
with(income[1:40,], plot(mean,prop, main="US family income for 2008",xlab="income", 
        ylab="Proportion of families",xlim=c(0,100000)))
with (income[1:40,], points(lowess(mean,prop,f=.3),typ="l"))
describe(income)


with(all.income, plot(mean,prop, main="US family income for 2008",xlab="income", 
                ylab="Proportion of families",xlim=c(0,250000)))
with (all.income[1:50,], points(lowess(mean,prop,f=.25),typ="l"))
#curve(100000* dlnorm(x, 10.8, .8), x = c(0,250000),ylab="Proportion")



