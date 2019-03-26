library(lawstat)


### Name: brunner.munzel.test
### Title: The Brunner-Munzel Test for Stochastic Equality
### Aliases: brunner.munzel.test
### Keywords: htest nonparametric

### ** Examples

## Pain score on the third day after surgery for 14 patients under
## the treatment Y and 11 patients under the treatment N
## (see Brunner and Munzel, 2000; Neubert and Brunner, 2007).

Y <- c(1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 2, 4, 1, 1)
N <- c(3, 3, 4, 3, 1, 2, 3, 1, 1, 5, 4)

brunner.munzel.test(Y, N)

##       Brunner-Munzel Test
## data: Y and N
## Brunner-Munzel Test Statistic = 3.1375,  df = 17.683, p-value = 0.005786
## 95 percent confidence interval:
##  0.5952169 0.9827052
## sample estimates:
## P(X<Y)+.5*P(X=Y)
##        0.788961



