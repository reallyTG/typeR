library(qad)


### Name: cci
### Title: Conditional confidence interval
### Aliases: cci

### ** Examples

set.seed(31415)
n <- 100
x <- runif(n, -2, 2)
y <- x^2 + rnorm(n, 0, 1)
sample <- data.frame(x, y)
plot(sample)
mod <- qad(sample, print = FALSE)

#Test for H0: independence
cci(n, alternative = "one.sided")
coef(mod, select = c('q(x1,x2)'))
if(coef(mod, select = c('q(x1,x2)')) > cci(n, alternative = "one.sided")[2]){
  print('Reject H0')
}else{
  print('Accept H0')
}



