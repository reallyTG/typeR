library(taxlist)


### Name: subset
### Title: Subset Method for taxlist Objects
### Aliases: subset subset,taxlist-method
### Keywords: methods

### ** Examples

library(taxlist)

data(Easplist)
Easplist <- subset(Easplist, lf_behn_2018 == "reed_plant", slot="traits")
summary(Easplist)

summary(as.factor(Easplist$lf_behn_2018))



