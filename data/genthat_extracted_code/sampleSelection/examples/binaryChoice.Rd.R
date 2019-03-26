library(sampleSelection)


### Name: probit
### Title: Binary choice models.
### Aliases: binaryChoice probit
### Keywords: models regression nonlinear

### ** Examples

## A simple MC trial: note probit assumes normal errors
x <- runif(100)
e <- 0.5*rnorm(100)
y <- x + e
summary(probit((y > 0) ~ x))
## female labour force participation probability
data(Mroz87)
Mroz87$kids <- Mroz87$kids5 > 0 | Mroz87$kids618 > 0
Mroz87$age30.39 <- Mroz87$age < 40
Mroz87$age50.60 <- Mroz87$age >= 50
summary(probit(lfp ~ kids + age30.39 + age50.60 + educ + hushrs +
               huseduc + huswage + mtr + motheduc, data=Mroz87))



