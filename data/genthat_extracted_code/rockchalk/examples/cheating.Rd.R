library(rockchalk)


### Name: cheating
### Title: Cheating and Looting in Japanese Electoral Politics
### Aliases: cheating
### Keywords: datasets

### ** Examples

require(rockchalk)
data(cheating)

table1model2 <- glm(cheating ~ viab + I(viab^2) + inc + cons + ur
+ newcand + jwins + cons_cwins + oth_cwins, family = binomial(link
= "logit"), data = cheating)

predictOMatic(table1model2)

predictOMatic(table1model2, interval = "confidence")

## The publication used "rare events logistic", which I'm not bothering
## with here because I don't want to invoke additional imported packages.
## But the ordinary logit results are proof of concept.



