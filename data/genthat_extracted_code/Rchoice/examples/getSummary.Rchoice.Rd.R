library(Rchoice)


### Name: getSummary.Rchoice
### Title: Get Model Summaries for Use with "mtable"
### Aliases: getSummary.Rchoice

### ** Examples


## Probit Model
data("Workmroz")
probit <- Rchoice(lfp ~ k5 + k618 + age + wc + hc + lwg + inc,  
                 data = Workmroz, family = binomial('probit'))
## Logit Model
logit <- Rchoice(lfp ~ k5 + k618 + age + wc + hc + lwg + inc,  
                 data = Workmroz, family = binomial('logit'))
                 
## Table with Models
library(memisc)
mtable("Probit Model"= probit, "Logit Model" = logit, 
       summary.stats = c("N", "Log-likelihood", "BIC", "AIC"))                 



