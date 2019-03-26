library(relimp)


### Name: relrelimp
### Title: Comparison of Relative Importances in a Multinomial Logit Model
### Aliases: relrelimp
### Keywords: models regression

### ** Examples

##  Data on housing and satisfaction, from Venables and Ripley
library(MASS)
library(nnet)
data(housing)
house.mult <- multinom(Sat ~ Infl + Type + Cont, weights = Freq,
  data = housing)
relrelimp(house.mult, set1 = 2:3, set2 = 7, 
                      label1 = "Influence", label2 = "Contact",
                      response.cat1 = "Medium", response.cat2 = "High")
## Computes the relative contribution of Influence and Contact in 
## each of the two logistic regressions (Med/Low and High/Low), and
## compares those two relative-contribution measures.



