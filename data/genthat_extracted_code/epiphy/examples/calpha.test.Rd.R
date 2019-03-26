library(epiphy)


### Name: calpha.test
### Title: C(alpha) test.
### Aliases: calpha.test calpha.test.fisher

### ** Examples

# For incidence data:
my_incidence <- incidence(tobacco_viruses)
my_fisher <- agg_index(my_incidence, method = "fisher")
calpha.test(my_fisher)




