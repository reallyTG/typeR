library(mratios)


### Name: Penicillin
### Title: Comparing 6 strains with respect to production of antibiotics
### Aliases: Penicillin
### Keywords: datasets

### ** Examples


library(mratios)

data(Penicillin)

str(Penicillin)

boxplot(diameter ~ strain, data=Penicillin)




