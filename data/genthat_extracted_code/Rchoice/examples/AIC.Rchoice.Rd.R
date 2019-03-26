library(Rchoice)


### Name: AIC.Rchoice
### Title: Akaike's Information Criterion
### Aliases: AIC.Rchoice BIC.Rchoice

### ** Examples

## Probit model
data("Workmroz")
probit <- Rchoice(lfp ~ k5 + k618 + age + wc + hc + lwg + inc,  
                 data = Workmroz , family = binomial('probit'))
summary(probit)

AIC(probit)
BIC(probit)



