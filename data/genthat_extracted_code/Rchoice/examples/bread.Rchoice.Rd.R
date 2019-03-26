library(Rchoice)


### Name: bread.Rchoice
### Title: Bread for sandwiches
### Aliases: bread.Rchoice

### ** Examples

## Probit model
data("Workmroz")
probit <- Rchoice(lfp ~ k5 + k618 + age + wc + hc + lwg + inc,  
                  data = Workmroz , family = binomial('probit'))
summary(probit)

library("sandwich")
bread(probit) 



