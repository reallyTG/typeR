library(Rchoice)


### Name: estfun.Rchoice
### Title: Gradient for observations
### Aliases: estfun.Rchoice

### ** Examples

## Probit model
data("Workmroz")
probit <- Rchoice(lfp ~ k5 + k618 + age + wc + hc + lwg + inc,  
                  data = Workmroz , family = binomial('probit'))
summary(probit)

library(sandwich)
estfun(probit) 



