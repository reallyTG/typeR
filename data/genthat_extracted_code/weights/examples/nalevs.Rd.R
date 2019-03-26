library(weights)


### Name: nalevs
### Title: Recode variables to 0-1 scale
### Aliases: nalevs

### ** Examples

data(anes04)
summary(anes04$age)
summary(nalevs(anes04$age))
table(anes04$educcats)
table(nalevs(anes04$educcats, naset=c(2, 4)))



