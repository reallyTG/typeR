library(structree)


### Name: rent
### Title: Munich Rent Data
### Aliases: rent

### ** Examples

data(rent)

y <- rent$nmqm
X <- rent[,-1]

boxplot(y)
summary(X)
 



