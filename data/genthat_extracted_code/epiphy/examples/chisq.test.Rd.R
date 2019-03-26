library(epiphy)


### Name: chisq.test
### Title: Chi-squared test.
### Aliases: chisq.test chisq.test.default chisq.test.fisher

### ** Examples

# For incidence data:
my_incidence <- incidence(tobacco_viruses)
my_fisher <- agg_index(my_incidence, method = "fisher")
chisq.test(my_fisher)




