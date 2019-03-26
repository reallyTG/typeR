library(SenSrivastava)


### Name: E1.15
### Title: Stevens Experiment to compare notes against a standard (80 Db)
### Aliases: E1.15
### Keywords: datasets

### ** Examples

data(E1.15)
attach(E1.15)
plot(x, logy)
abline(lm( logy ~ x, data=E1.15))
detach()



