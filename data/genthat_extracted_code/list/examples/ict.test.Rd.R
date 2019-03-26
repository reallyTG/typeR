library(list)


### Name: ict.test
### Title: Item Count Technique
### Aliases: ict.test
### Keywords: models regression

### ** Examples



data(affirm)
data(race)

# Conduct test with null hypothesis that there is no design effect
# Replicates results on Blair and Imai (2012) pg. 69

test.value.affirm <- ict.test(affirm$y, affirm$treat, J = 3, gms = TRUE)
print(test.value.affirm)

test.value.race <- ict.test(race$y, race$treat, J = 3, gms = TRUE)
print(test.value.race)





