library(epiphy)


### Name: agg_index
### Title: Several aggregation indices.
### Aliases: agg_index

### ** Examples

# Count flavor of Fisher's index:
my_fisher_count <- agg_index(aphids$i)
my_fisher_count

# And incidence flavor of Fisher's index:
my_fisher_incidence <- agg_index(tobacco_viruses$i, n = tobacco_viruses$n)
my_fisher_incidence

# Either standard R or epiphy idioms can be used:
identical(my_fisher_count, agg_index(count(aphids)))
identical(my_fisher_incidence, agg_index(incidence(tobacco_viruses)))

# Lloyd's index (only for count data):
agg_index(aphids$i, method = "lloyd")
# Lloyd's mean crowding:
agg_index(aphids$i, method = "lloyd", type = "mean-crowding")

# Count flavor of Morisita's index:
agg_index(aphids$i,  method = "morisita")
# Incidence flavor of Morisita's index:
agg_index(tobacco_viruses$i, n = tobacco_viruses$n, method = "morisita")




