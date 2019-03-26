library(epiphy)


### Name: z.test
### Title: Z-test.
### Aliases: z.test z.test.default z.test.fisher

### ** Examples

# For incidence data:
my_incidence <- incidence(tobacco_viruses)
my_fisher <- agg_index(my_incidence, method = "fisher")
z.test(my_fisher)




