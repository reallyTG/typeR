library(nlme)


### Name: corRatio
### Title: Rational Quadratic Correlation Structure
### Aliases: corRatio
### Keywords: models

### ** Examples

sp1 <- corRatio(form = ~ x + y + z)

# example lme(..., corRatio ...)
# Pinheiro and Bates, pp. 222-249
fm1BW.lme <- lme(weight ~ Time * Diet, BodyWeight,
                   random = ~ Time)
# p. 223
fm2BW.lme <- update(fm1BW.lme, weights = varPower())
# p 246 
fm3BW.lme <- update(fm2BW.lme,
           correlation = corExp(form = ~ Time))
# p. 249
fm5BW.lme <- update(fm3BW.lme, correlation =
                   corRatio(form = ~ Time))

# example gls(..., corRatio ...)
# Pinheiro and Bates, pp. 261, 263
fm1Wheat2 <- gls(yield ~ variety - 1, Wheat2)
# p. 263 
fm3Wheat2 <- update(fm1Wheat2, corr = 
    corRatio(c(12.5, 0.2),
       form = ~ latitude + longitude,
             nugget = TRUE))




